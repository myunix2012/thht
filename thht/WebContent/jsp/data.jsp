<%@ page contentType="text/html; charset=utf-8"  language="java" %>
<%@ page import="java.sql.*,java.io.*,java.util.*,javax.sql.DataSource,javax.naming.*"%>
<% 
Properties pro = new Properties();  
String realpath = request.getRealPath("/");  
FileInputStream in = new FileInputStream(realpath+"WEB-INF/db.properties");  
pro.load(in); 
String dburl = pro.getProperty("dburl");  
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
Connection conn= DriverManager.getConnection(dburl);  
Statement stmt=null;
ResultSet rs=null;
	String days = "",d1 = "",d2 = "",d3 = "",d4 = "",d5 = "",d6 = "";
	try{
		//myData = new Data();
        
		//String sql = "SELECT fid,chp1,chp2,chp3,chp4,chp5,chp6 FROM thht limit 10";
		//rs = myData.executeQuery(sql);
		
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);   
		String sql="select top 10 gettime,chp1,chp2,chp3,chp4,chp5,chp6 from getdata order by id desc"; 
		rs=stmt.executeQuery(sql);
		if(rs!=null){ 
			rs.last();
            while(rs.previous()){ 
            	String ctime=rs.getString(1).substring(11, 16);
				//days += ",\"" + rs.getString(1) + "\"";
				days += ",\"" + ctime + "\"";
				d1 += "," + rs.getString(2) + "";
				d2 += "," + rs.getString(3) + "";
				d3 += "," + rs.getString(4) + "";
				d4 += "," + rs.getString(5) + "";
				d5 += "," + rs.getString(6) + "";
				d6 += "," + rs.getString(7) + "";
            }rs.close();
        }
    }catch(Exception e){ System.out.println(e.getMessage()); }
	finally
	{ if(rs!=null)
		rs.close();  
	if(stmt!=null)stmt.close(); }
%>
{
"days":[<%=days.substring(1)%>]
,"d1":[<%=d1.substring(1)%>]
,"d2":[<%=d2.substring(1)%>]
,"d3":[<%=d3.substring(1)%>]
,"d4":[<%=d4.substring(1)%>]
,"d5":[<%=d5.substring(1)%>]
,"d6":[<%=d6.substring(1)%>]
}