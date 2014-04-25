/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.DriverManager;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.Statement;

/**
 * 
 * @author samuel
 */
public class DBConn {

	private Connection con = null;
	private Statement stmt = null;

	private String driver = "com.mysql.jdbc.Driver";
	private String database = "qrbs";
	private String uname = "root";
	private String passwd = "root";
	ResultSet rset = null;
	int i = 0;

	public DBConn() {

		init();
	}

	public DBConn(String database, String uname, String passwd) {
		this.database = database;
		this.uname = uname;
		this.passwd = passwd;
		init();
	}

	private void init() {
		try {
			System.out.println("In init()");
			Class.forName(this.driver);
			con = DriverManager.getConnection("jdbc:mysql://localhost/"
					+ this.database, this.uname, this.passwd);
			con.setAutoCommit(false);
			stmt = con.createStatement();
			System.out.println("Connection Established " + con);
		} catch (Exception e) {
			System.out.println("Exception: " + e);
		}
	}

	public int executeUpdate(String query) {

		try {
			i = stmt.executeUpdate(query);
			con.commit();
			System.out.println(i);
		} catch (Exception e) {
			System.out.println("Execute Update Err >>" + e);
		}
		return i;
	}

	public ResultSet executeQuery(String query) {

		try {
			con.commit();
			rset = stmt.executeQuery(query);
			// System.out.println("HAIi"+rset+rset.next()+rset.getString(2));

		} catch (Exception e) {
			System.out.println("Execute Query Err>>" + e);
		}
		return rset;
	}
	
	public void close(){
		try {
			//con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	public static void main(String[] args) {
		new DBConn();
	}

}