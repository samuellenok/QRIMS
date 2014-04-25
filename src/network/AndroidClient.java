package network;

import java.io.BufferedReader;
//import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.*;
import java.util.ArrayList;

//import com.sarath.lanmanager.AndroidClient;

public class AndroidClient {

	Socket soc = null;
	InputStream in = null;
	BufferedReader din = null;
	OutputStream out = null;
	PrintStream ps = null;

	public AndroidClient(String ip, int port) {
		try {
			soc = new Socket(ip, port);
			in = soc.getInputStream();
			din = new BufferedReader(new InputStreamReader(in));
			out = soc.getOutputStream();
			ps = new PrintStream(out);
			ps.println("android");
		} catch (Exception e) {
			pln("Client Constructor Err >>" + e);
		}
	}

	public void fetchFile(String fname, String path) {
		try {

			ps.println("fetchfile");
			ps.println(fname);
			String sz = din.readLine();
			int replySize = Integer.parseInt(sz);
			int ch = 0;
			int cnt = 0;
			// String reply="";
			FileOutputStream fout = new FileOutputStream(path);
			byte b[] = new byte[1024];
			while ((ch = in.read(b)) != -1) {
				cnt += ch;
				fout.write(b, 0, ch);
				if (cnt >= replySize)
					break;
			}
			fout.close();
			pln("file Received");
			pln("*********");
			ps.println("exit");
		} catch (Exception e) {

		}
	}

	public void saveFile(String fpath) {
		try {
			ps.println("savefile");
			File fl = new File(fpath);
			ps.println(fl.getName());
			FileInputStream fin = new FileInputStream(fl);
			byte b[] = new byte[fin.available()];
			int ch = fin.read(b);
			ps.println(b.length + "");
			Thread.sleep(500);
			out.write(b, 0, ch);
			out.flush();
			pln("file Received");
			pln("*********");
			ps.println("exit");
		} catch (Exception e) {
		}
	}

	public String saveSales(ArrayList<String> bList,String Staff_id) {
		String msg = "";
		try {
			//bList.add(Staff_id);
			ps.println("saveSale");//ps.println("saveSales");
			ps.println(bList);
			//Thread.sleep(2500);
			ps.println(1);
			pln("*********");
			msg = din.readLine();
			ps.println("exit");

		} catch (Exception e) {
			msg = msg+"Exeception" + e;
		}
		return msg;
	}

	public void pln(Object obj) {
		System.out.println(obj);
	}
	public ArrayList getProductList() {
		//TODO Auto-generated method stub
		
		ArrayList pList = new ArrayList();
		try {
			ps.println("getPdtList");
			String pListS=din.readLine();
			String[] temp = pListS.split(",");
			for (int i = 0; i < temp.length; i++) {
				pList.add(temp[i]);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return pList;
		
	}
	public String logincheck(String userName, String password) {
		// TODO Auto-generated method stub
		String msg="";
		try {
			ps.println("logincheck");
			ps.println(userName);
			ps.println(password);
			
			Thread.sleep(150);
			msg=din.readLine();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}
	public static void main(String args[]) {
		AndroidClient ob = new AndroidClient("localhost", 1234);
		String msg=ob.logincheck("ajit","ajit");
		if(!msg.startsWith("Invalid")){
		ArrayList abc= ob.getProductList();
		ArrayList<String> bList = new ArrayList<String>();
		bList.add("id");
		bList.add("Name");
		bList.add("Price");
		bList.add("Discount");
		bList.add("Tax");
		bList.add("Qty");
		String contents = "7:colgate:50:2:48:1";
		String str[] = contents.split(":");
		for (int k = 0; k < str.length; k++) {
			bList.add(str[k]);
		}
		String contents2 = "7:colgate:40:2:58:1";
		String str2[] = contents2.split(":");
		for (int k = 0; k < str.length; k++) {
			bList.add(str[k]);
		}
		ob.saveSales(bList,"100");
		}
	}

	
}
