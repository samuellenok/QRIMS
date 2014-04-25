<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<%@page import="Database.DBConn ,java.net.URL, java.net.URLConnection,java.io.InputStream,java.net.MalformedURLException,java.io.FileOutputStream,java.io.IOException;" %>
         <%
         if(request.getParameter("action")!=null){
             if(request.getParameter("action").startsWith("delete")){
                 if(request.getParameter("id")!=null){
                     DBConn db=new DBConn();
                     try{
                     int j=db.executeUpdate("DELETE FROM qrbs_supplier WHERE id='"+request.getParameter("id")+"'");
                     if(j>0){
                         response.sendRedirect("supplier.jsp?type=Sucess&id="+request.getParameter("id"));
                     }
                     else
                     {
                           response.sendRedirect("updateSupplierDetails.jsp?type=fail&id="+request.getParameter("id"));
                     } 
                     }
                     catch(Exception e){
                     }
                  }
                 }
             }
        else{
        DBConn db=new DBConn();
        String name=request.getParameter("user_name");
        String user_email=request.getParameter("user_email");
        String mob=request.getParameter("mob");
        String landline=request.getParameter("landline");
        String address=request.getParameter("address"); 
        String zip=request.getParameter("zip");
        String datatoQR=name+user_email+mob+landline+address+zip;
        System.out.print("data"+datatoQR);
        
      /*  try {
            URL url=new URL("http://chart.apis.google.com/chart?cht=qr&chl="+datatoQR+"&chs=120x120");
            URLConnection uc=url.openConnection();
            InputStream in= uc.getInputStream();
            String fileName=name+System.currentTimeMillis()+".png";
            FileOutputStream fout=new FileOutputStream("/QRBS_Server/assets/img/supplierimages/"+fileName);
            int ch=0;
            while ((ch=in.read())!=-1) {
                fout.write(ch);
            }   
           
                in.close();
                fout.close();
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
       */ try{
        int j=db.executeUpdate("UPDATE qrbs_supplier SET name='"+name+"',mobile='"+mob+"',landline='"+landline+"',email='"+user_email+"',postal_address='"+address+"',postcode='"+zip+"' WHERE id='"+request.getParameter("id")+"'");
          if(j>0){
                response.sendRedirect("updateSupplierDetails.jsp?type=Sucess&id="+request.getParameter("id"));
               }         
            else
            {
               response.sendRedirect("updateSupplierDetails.jsp?type=fail&id="+request.getParameter("id"));
            }              
        }
           catch(Exception e){
           }
        }
       %>
