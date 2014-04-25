<%@page import="java.net.*,java.io.*,java.sql.ResultSet,Database.DBConn,java.io.*"%>
<%
Socket soc=null;
InputStream in=null;
BufferedReader din=null;
OutputStream outs=null;
PrintStream ps=null;
String msg = "";
    try {
            soc=new Socket("localhost",1234);
            in=soc.getInputStream();
            din=new BufferedReader(new InputStreamReader(in));
            outs=soc.getOutputStream();
            ps=new PrintStream(outs);
            ps.println("android");
            
            try {
                //bList.add(Staff_id);
                if(request.getParameter("blist")!=null){
                ps.println("saveSale");//ps.println("saveSales");
                ps.println(request.getParameter("blist"));
                //Thread.sleep(2500);
                ps.println(session.getAttribute( "user_id" ));
               // pln("*********");
                msg = din.readLine();
                ps.println("exit");
                DBConn db=new DBConn();
                if(msg.equals("sales saved sucessfully")){
                int i=db.executeUpdate("UPDATE  qrbs_cart SET status='1' WHERE id='"+request.getParameter("id")+"'");
                 if(i>0){
                                 response.sendRedirect("cartItemList.jsp?type=Sucess&msg="+msg+"&id="+request.getParameter("id"));
                             }
                             else
                             {
                                 response.sendRedirect("cartItemList.jsp?type=fail&msg="+msg+"&id="+request.getParameter("id"));
                             }
               // response.sendRedirect("cartItemList.jsp?msg="+msg);
                }else
                	response.sendRedirect("cartItemList.jsp?msg=some error occured&type=fail&id="+request.getParameter("id"));
                }else
                    response.sendRedirect("cartItemList.jsp?msg=some error occured&type=fail&id="+request.getParameter("id"));
                
            } catch (Exception e) {
                msg = msg+"Exeception" + e;
                response.sendRedirect("cartItemList.jsp?type=fail&id="+request.getParameter("id")+"&msg="+msg);
            }
            
        } catch (Exception e) {
            //out.println("Client Constructor Err >>"+e);
        	msg = msg+"Exeception" + e;
            response.sendRedirect("cartItemList.jsp?type=fail&id="+request.getParameter("id")+"&msg="+msg);
        }
        %>