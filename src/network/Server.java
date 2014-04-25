package network;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.MessageLog;
import Database.DBConn;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
public class Server extends Thread {
	int jobId = 0;
	MessageLog ml = new MessageLog();
	String[] temp ;
    HttpURLConnection connection = null;  
    PrintWriter outWriter = null;  
    BufferedReader serverResponse = null;  
    StringBuffer buff = new StringBuffer();
	public void run() {
		try {
			new File("./WebContent/assets/files/").mkdirs();
			ServerSocket ser = new ServerSocket(1234);
			System.out.println("Server Waiting");
			while (true) {
				Socket soc = ser.accept();
				System.out.println(soc);
				new Child(soc).start();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public class Child extends Thread {
		Socket csoc = null;
		public Child(Socket s) {
			csoc = s;
		}
		public void run() {
			try {
				InputStream in = csoc.getInputStream();
				BufferedReader br = new BufferedReader(
						new InputStreamReader(in));
				String type = br.readLine();
				while (true) {
					String str = br.readLine();
					pln("Client Messages>>" + str);
					if (str == null)
						break;
					if (str.equals("exit"))
						break;
					else if (str.equals("saveQR")) {
						String path = br.readLine();
						String id=br.readLine();
						//pln("SUCESS"+id);
						DBConn db = new DBConn();
						int i = db.executeUpdate("UPDATE qrbs_products SET qr_image='"+path+"' WHERE id='"+id+"'");
						if (i>0) {
							sendReply(csoc,"Sucessfully uploaded");
						//	pln("SUCESS");
							
						}
						else{
							sendReply(csoc,"Oops! Some Error occured try again later");
						  //  pln("Invalid");
						}
						
					} 
					else if (str.equals("fetchfile")) {
						String fname = br.readLine();
						sendFileReply(csoc, "./testdir/" + fname);
					} 
					
					
					else if (str.equals("savefile")) {
						String fname = br.readLine();
						String sz = br.readLine();
						int replySize = Integer.parseInt(sz);
						int ch = 0;
						int cnt = 0;
						// String reply="";
						FileOutputStream fout = new FileOutputStream("./WebContent/assets/files/" + fname);
						byte b[] = new byte[1024];
						while ((ch = in.read(b)) != -1) {
							cnt += ch;
							fout.write(b, 0, ch);
							if (cnt >= replySize)
								break;
						}
						fout.close();
						pln("file Received");
						
						sendFileReply(csoc,fname);
					}
					else if (str.startsWith("getPdtList")) {
						DBConn db = new DBConn();
						ArrayList pList=new ArrayList();
						ResultSet rs = db.executeQuery("SELECT id,name FROM qrbs_products WHERE stock>0");
						while (rs.next()) {
							pList.add(rs.getString("id")+":"+rs.getString("name"));
						}
						pln(pList.toString());
						sendReply(csoc, pList.toString());
					}
					else if (str.startsWith("logincheck")) {
						DBConn db = new DBConn();
						String userName=br.readLine();
						String password=br.readLine();
						ResultSet rs = db.executeQuery("SELECT id FROM qrbs_user WHERE username='"+userName+"'&& password_hash='"+password+"'&& user_type=1||user_type=2");
						if (rs.next()) {
							sendReply(csoc, rs.getString("id"));
							pln("id"+rs.getString("id"));
						}
						else
							sendReply(csoc, "Invalid");
						    pln("Invalid");
						
					}
					else if (str.equals("changepass")) {
						DBConn db = new DBConn();
						String uid=br.readLine();
						String newpas=br.readLine();
						int i=db.executeUpdate("UPDATE qrbs_user SET password_hash='"+newpas+"' WHERE id='"+uid+"'");
						if (i>0) {
							sendReply(csoc, "success");
						}
						else{
							sendReply(csoc, "oops!");
						    pln("oops");
						}
						
					}
					else if (str.equals("saveCart")) {
						Connection conn = null;
				        try {
				            Class.forName("com.mysql.jdbc.Driver");
				            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/qrbs","root", "root");
				            conn.setAutoCommit(false);
							String sBList = br.readLine();
							pln("BList" + sBList);
							System.out.print("BList" + sBList);
							temp = sBList.split(",");
							DBConn db = new DBConn();
							String userID = br.readLine();
							pln("StaffID" + userID);
				            String query = "INSERT INTO qrbs_cart(user_id) VALUES (?)";
				            PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(query,
				                    PreparedStatement.RETURN_GENERATED_KEYS);
				            stmt.setString(1, userID);
				            stmt.execute();

				            ResultSet keys = stmt.getGeneratedKeys();
				            int id = 1;
				            if (keys.next()) {
				                id = keys.getInt(1);
				            }

				            //
				            // This is an invalid statement that will cause exception to 
				            // demonstrate a rollback.
				            //
				            for (int i = 1; i < temp.length / 6; i++) {
					            query = "INSERT INTO qrbs_cart_item(cart_id,product_id,price,discount,tax_percentage,qty) VALUES (?, ?, ?, ?, ?,?)";
					            PreparedStatement detailStmt = (PreparedStatement) conn.prepareStatement(query);
					            detailStmt.setInt(1, id);
					            detailStmt.setString(2,temp[i * 6 + 0] );
					            detailStmt.setString(3, temp[i * 6 + 2]);
					            detailStmt.setString(4, temp[i * 6 + 3]);
					            detailStmt.setString(5, temp[i * 6 + 4]);
					            detailStmt.setString(6, temp[i * 6 + 5]);
					            detailStmt.execute();
					            query="SELECT * FROM qrbs_products  WHERE id=? && stock-?>0";
					            PreparedStatement stockUp =(PreparedStatement) conn.prepareStatement(query);
					            stockUp.setString(1,temp[i * 6 +0] );
					            stockUp.setString(2,temp[i * 6 +5] );
					            int rows=0;
					            ResultSet rs=stockUp.executeQuery();
					            while ( rs.next() )  
					            {  
					                // Process the row.  
					                rows++;  
					            }  
					            System.out.printf("%d row(s) updated!", rows);
					            if(rows<=0)
					             throw new Exception("Some products are not in Database/Out of Stock Please check it");
					            else{
					            	PreparedStatement stockchk =(PreparedStatement) conn.prepareStatement("SELECT stock,reorderlevel FROM qrbs_products  WHERE id='"+temp[i * 6 + 0]+"'");
					            	stockchk.executeQuery();
					            	ResultSet rs1=stockchk.getResultSet();
					            	rs1.next();
					            	if(Integer.parseInt(rs1.getString("stock"))<Integer.parseInt(rs1.getString("reorderlevel"))){
					            	try  
					            	{  
					    		
										    //OPEN CONNECTION  
										    connection = ( HttpURLConnection ) new URL( "http://daniqrims.site40.net/mail.php" ).openConnection();  
										      //?message=The Product "+temp[i * 6 + 1]+"Reached its minimum level and It needs to be re ordered&submit=Send
										    //SET REQUEST INFO  
										    connection.setRequestMethod( "POST" );  
										    connection.setDoOutput( true );  
										      
										    //CREATE A WRITER FOR OUTPUT  
										    outWriter = new PrintWriter( connection.getOutputStream() );  
										      
										    //PARAMETERS  
										    buff.append( "message=" );   
										    buff.append( URLEncoder.encode( "The Product "+temp[i * 6 + 1]+" Reached its minimum level and It needs to be re ordered ", "UTF-8" ) );  
										    buff.append( "to=" );   
										    buff.append( URLEncoder.encode( "samuelj90@gmail.com", "UTF-8" ) );  
										        
										    //SEND PARAMETERS  
										    outWriter.println( buff.toString() );  
										    outWriter.flush();  
										    outWriter.close(); 
										     
										    //RESPONSE STREAM  
										    serverResponse = new BufferedReader( new InputStreamReader( connection.getInputStream() ) );  
										      
										    //READ THE RESPOSNE  
										    String line;  
										    while ( (line = serverResponse.readLine() ) != null )   
										    {  
										    	System.out.println( line );  
										    }  
					            			
									}
					            	catch (MalformedURLException mue)  
									{  
									    mue.printStackTrace();  
								    }  
								    catch (IOException ioe)  
								    {  
								    	ioe.printStackTrace();  
								    }
								    catch (Exception e) {
										pln("error"+e);// TODO: handle exception
									}
								    finally  
								    {  
									    if ( connection != null )  
									    	connection.disconnect();   
									    if ( serverResponse != null )  
									    {  
									    try { 
									    	serverResponse.close();
									    } catch (Exception ex) {}  
									    }  
								    }
					            	}
					            }
					            	//{checkstock(temp[i * 6 +0],temp[i * 6 +1] );
					            pln("id"+temp[i * 6 +0]);
					            pln("name"+temp[i * 6 + 1]);
					            pln("price"+temp[i * 6 + 2]);
					            pln("discount"+temp[i * 6 + 3]);
					            pln("tax"+temp[i * 6 + 4]);
					            pln("qty"+temp[i * 6 + 5]);
							}  
				            
				            //
				            // Commit transaction to mark it as a success database operation
				            //
				            conn.commit();
				            System.out.println("Transaction commit...");
				            sendReply(csoc, "Cart saved sucessfully");
				        } catch (SQLException e) {
				            //
				            // Rollback any database transaction due to exception occurred
				            //
				            if (conn != null) {
				                conn.rollback();
				                System.out.println("Transaction rollback...");
				                
				            }
				            e.printStackTrace();
				            sendReply(csoc, "Exception"+e);
				            
				        }catch (Exception e) {
				        	 System.out.println("exception"+e);// TODO: handle exception
				        	 if (conn != null) {
					                conn.rollback();
					                System.out.println("Transaction rollback...");
					            }
				        	 sendReply(csoc, "Exception"+e);
						} finally {
				            if (conn != null && !conn.isClosed()) {
				                conn.close();
				            }
				            
				        }
							
					} 
					else if (str.startsWith("saveSale")) {
						Connection conn = null;
				        try {
				            Class.forName("com.mysql.jdbc.Driver");
				            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/qrbs","root", "root");
				            conn.setAutoCommit(false);
							String sBList = br.readLine();
							pln("BList" + sBList);
							System.out.print("BList" + sBList);
							temp = sBList.split(",");
							DBConn db = new DBConn();
							String staffID = br.readLine();
							pln("StaffID" + staffID);
				            String query = "INSERT INTO qrbs_sales(staff_id) VALUES (?)";
				            PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(query,
				                    PreparedStatement.RETURN_GENERATED_KEYS);
				            stmt.setString(1, staffID);
				            stmt.execute();

				            ResultSet keys = stmt.getGeneratedKeys();
				            int id = 1;
				            if (keys.next()) {
				                id = keys.getInt(1);
				            }

				            //
				            // This is an invalid statement that will cause exception to 
				            // demonstrate a rollback.
				            //
				            for (int i = 1; i < temp.length / 6; i++) {
					            query = "INSERT INTO qrbs_sales_item(sales_id,product_id,price,discount,tax_percentage,qty) VALUES (?, ?, ?, ?, ?,?)";
					            PreparedStatement detailStmt = (PreparedStatement) conn.prepareStatement(query);
					            detailStmt.setInt(1, id);
					            detailStmt.setString(2,temp[i * 6 + 0] );
					            detailStmt.setString(3, temp[i * 6 + 2]);
					            detailStmt.setString(4, temp[i * 6 + 3]);
					            detailStmt.setString(5, temp[i * 6 + 4]);
					            detailStmt.setString(6, temp[i * 6 + 5]);
					            detailStmt.execute();
					            query="UPDATE qrbs_products  SET stock=stock-? WHERE id=? && stock-?>0";
					            PreparedStatement stockUp =(PreparedStatement) conn.prepareStatement(query);
					            stockUp.setString(1,temp[i * 6 +5] );
					            stockUp.setString(2,temp[i * 6 +0] );
					            stockUp.setString(3,temp[i * 6 +5] );
					            int rows=stockUp.executeUpdate();
					            System.out.printf("%d row(s) updated!", rows);
					            if(rows<=0)
					             throw new Exception("Some products are not in Database/Out of Stock Please check it");
					            else{
					            	PreparedStatement stockchk =(PreparedStatement) conn.prepareStatement("SELECT stock,reorderlevel FROM qrbs_products  WHERE id='"+temp[i * 6 + 0]+"'");
					            	stockchk.executeQuery();
					            	ResultSet rs1=stockchk.getResultSet();
					            	rs1.next();
					            	if(Integer.parseInt(rs1.getString("stock"))<Integer.parseInt(rs1.getString("reorderlevel"))){
					            	try  
					            	{  
					    		
										    //OPEN CONNECTION  
										    connection = ( HttpURLConnection ) new URL( "http://daniqrims.site40.net/mail.php" ).openConnection();  
										      //?message=The Product "+temp[i * 6 + 1]+"Reached its minimum level and It needs to be re ordered&submit=Send
										    //SET REQUEST INFO  
										    connection.setRequestMethod( "POST" );  
										    connection.setDoOutput( true );  
										      
										    //CREATE A WRITER FOR OUTPUT  
										    outWriter = new PrintWriter( connection.getOutputStream() );  
										      
										    //PARAMETERS  
										    buff.append( "message=" );   
										    buff.append( URLEncoder.encode( "The Product "+temp[i * 6 + 1]+" Reached its minimum level and It needs to be re ordered ", "UTF-8" ) );  
										    buff.append( "to=" );   
										    buff.append( URLEncoder.encode( "samuelj90@gmail.com", "UTF-8" ) );  
										        
										    //SEND PARAMETERS  
										    outWriter.println( buff.toString() );  
										    outWriter.flush();  
										    outWriter.close(); 
										     
										    //RESPONSE STREAM  
										    serverResponse = new BufferedReader( new InputStreamReader( connection.getInputStream() ) );  
										      
										    //READ THE RESPOSNE  
										    String line;  
										    while ( (line = serverResponse.readLine() ) != null )   
										    {  
										    	System.out.println( line );  
										    }  
					            			
									}
					            	catch (MalformedURLException mue)  
									{  
									    mue.printStackTrace();  
								    }  
								    catch (IOException ioe)  
								    {  
								    	ioe.printStackTrace();  
								    }
								    catch (Exception e) {
										pln("error"+e);// TODO: handle exception
									}
								    finally  
								    {  
									    if ( connection != null )  
									    	connection.disconnect();   
									    if ( serverResponse != null )  
									    {  
									    try { 
									    	serverResponse.close();
									    } catch (Exception ex) {}  
									    }  
								    }
					            	}
					            }
					            	//{checkstock(temp[i * 6 +0],temp[i * 6 +1] );
					            pln("id"+temp[i * 6 +0]);
					            pln("name"+temp[i * 6 + 1]);
					            pln("price"+temp[i * 6 + 2]);
					            pln("discount"+temp[i * 6 + 3]);
					            pln("tax"+temp[i * 6 + 4]);
					            pln("qty"+temp[i * 6 + 5]);
							}  
				            
				            //
				            // Commit transaction to mark it as a success database operation
				            //
				            conn.commit();
				            System.out.println("Transaction commit...");
				            sendReply(csoc, "sales saved sucessfully");
				        } catch (SQLException e) {
				            //
				            // Rollback any database transaction due to exception occurred
				            //
				            if (conn != null) {
				                conn.rollback();
				                System.out.println("Transaction rollback...");
				                
				            }
				            e.printStackTrace();
				            sendReply(csoc, "Exception"+e);
				            
				        }catch (Exception e) {
				        	 System.out.println("exception"+e);// TODO: handle exception
				        	 if (conn != null) {
					                conn.rollback();
					                System.out.println("Transaction rollback...");
					            }
				        	 sendReply(csoc, "Exception"+e);
						} finally {
				            if (conn != null && !conn.isClosed()) {
				                conn.close();
				            }
				            
				        }
						
					}

				}
				br.close();
			} catch (Exception e) {

				e.printStackTrace();
			}
		}
		private void checkstock(String id,String name) {
			// TODO Auto-generated method stub
			
			

 
    		
		}
	}
	
	public void sendFileReply(Socket csoc, String path) {
		try {
			OutputStream out = csoc.getOutputStream();
			PrintStream ps = new PrintStream(out);
			File fl = new File(path);
			FileInputStream fin = new FileInputStream(fl);
			byte[] data = new byte[fin.available()];
			int ch = fin.read(data);
			fin.close();

			ps.println(data.length + "");
			Thread.sleep(500);
			out.write(data);
			out.flush();

		} catch (Exception e) {
			pln("Send Process List Reply Err>>" + e);
		}
	}

	public void sendReply(Socket csoc, String msg) {
		try {
			OutputStream out = csoc.getOutputStream();
			PrintStream ps = new PrintStream(out);
			ps.println(msg);
			Thread.sleep(500);
		} catch (Exception e) {
			pln("Send Reply Err>>" + e);
		}
	}

	public void pln(Object obj) {
		// System.out.println(obj);
		ml.log(obj + "");
	}
	
	public static void main(String[] args) {

		new Server().start();
	}

}
