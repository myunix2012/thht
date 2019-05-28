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
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);  
Statement stmt10=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
Statement stmtH=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
Statement stmtD=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
Statement stmtV=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
String sql="select * from getdata where id=(select max(id) from getdata)"; 
String sql10="select round(avg(chp1),2) as chp1,round(avg(chp2),2) as chp2,round(avg(chp3),2) as chp3,round(avg(chp4),2) as chp4,round(avg(chp5),2) as chp5,round(avg(chp6),2) as chp6 from getdata where id>=(select MIN(id) from getdata WHERE id in (select top(10) id from getdata ORDER BY id desc))";
String sqlh="select round(chp1,2) as chp1,round(chp2,2) as chp2,round(chp3,2) as chp3,round(chp4,2) as chp4,round(chp5,2) as chp5,round(chp6,2) as chp6 from getdataH where id=(select max(id) from getdataH)"; 
String sqld="select round(chp1,2) as chp1,round(chp2,2) as chp2,round(chp3,2) as chp3,round(chp4,2) as chp4,round(chp5,2) as chp5,round(chp6,2) as chp6 from getdataD where id=(select max(id) from getdataD)"; 
String sqlV="select NOX,SO2,O2,temperature,dust,CurrentSpeed  from t_value"; 
ResultSet rs=stmt.executeQuery(sql);
ResultSet rs10=stmt10.executeQuery(sql10);
ResultSet rsh=stmtH.executeQuery(sqlh);
ResultSet rsd=stmtD.executeQuery(sqld);
ResultSet rsv=stmtV.executeQuery(sqlV);
while(rs.next()&&rs10.next()&&rsh.next()&&rsd.next()&&rsv.next())
{
%>  
<div class="container">
	<div class="row clearfix">
		<div class="col-md-6 column">
			<h3>
			工艺流程1号塔       <a target="_blank">折算值</a>/<a href="/thht/jsp/l.jsp">折线图</a>
				
			</h3>
			<table class="table table-striped">
				<thead>
					<tr >
						<th>
							名称
						</th>
						<th>
							实时值
						</th>
						<th>
							10分钟平均值
						</th>
						<th>
							小时均值
						</th>
						<th>
							日均值
						</th>
						
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td>
							NOX（mg/m3）
						</td>
						<td>
						<% if(Float.valueOf(rs.getString("chp1"))>Float.valueOf(rsv.getString("NOX")))
						{
							%>	
							<font color="red"><%=rs.getString("chp1")%>
							<%
							
						}
						else
						{
							%>	
							<%=rs.getString("chp1")%>
							<%
							
						}
						%>

						</td>
						
						<td>
							<% if(Float.valueOf(rs10.getString("chp1"))>Float.valueOf(rsv.getString("NOX")))
						{
							%>	
							<font color="red"><%=rs10.getString("chp1")%>
							<%
							
						}
						else
						{
							%>	
							<%=rs10.getString("chp1")%>
							<%
							
						}
						%>

						</td>
						
						
						<td>
						
							<% if(Float.valueOf(rsh.getString("chp1"))>Float.valueOf(rsv.getString("NOX")))
						{
							%>	
							<font color="red"><%=rsh.getString("chp1")%>
							<%
							
						}
						else
						{
							%>	
							<%=rsh.getString("chp1")%>
							<%
							
						}
						%>

						</td>
						
						
						<td>
						
							<% if(Float.valueOf(rsd.getString("chp1"))>Float.valueOf(rsv.getString("NOX")))
						{
							%>	
							<font color="red"><%=rsd.getString("chp1")%>
							<%
							
						}
						else
						{
							%>	
							<%=rsd.getString("chp1")%>
							<%
							
						}
						%>

						</td>
						
						
						
										
					</tr>
					<tr class="success">
						<td>
							SO2（mg/m3）
						</td>
												<td>
						<% if(Float.valueOf(rs.getString("chp2"))>Float.valueOf(rsv.getString("SO2")))
						{
							%>	
							<font color="red"><%=rs.getString("chp2")%>
							<%
							
						}
						else
						{
							%>	
							<%=rs.getString("chp2")%>
							<%
							
						}
						%>

						</td>
						
						<td>
							<% if(Float.valueOf(rs10.getString("chp2"))>Float.valueOf(rsv.getString("SO2")))
						{
							%>	
							<font color="red"><%=rs10.getString("chp2")%>
							<%
							
						}
						else
						{
							%>	
							<%=rs10.getString("chp2")%>
							<%
							
						}
						%>

						</td>
						
						
						<td>
						
							<% if(Float.valueOf(rsh.getString("chp2"))>Float.valueOf(rsv.getString("SO2")))
						{
							%>	
							<font color="red"><%=rsh.getString("chp2")%>
							<%
							
						}
						else
						{
							%>	
							<%=rsh.getString("chp2")%>
							<%
							
						}
						%>

						</td>
						
						
						<td>
						
							<% if(Float.valueOf(rsd.getString("chp2"))>Float.valueOf(rsv.getString("SO2")))
						{
							%>	
							<font color="red"><%=rsd.getString("chp2")%>
							<%
							
						}
						else
						{
							%>	
							<%=rsd.getString("chp2")%>
							<%
							
						}
						%>

						</td>
						
					</tr>
					<tr class="warning">
						<td>
							O2(%)
						</td>
						<td>
							<%=rs.getString("chp3")%> 
						</td>
							<td>
							<%=rs10.getString("chp3")%> 
						</td>
						<td>
							<%=rsh.getString("chp3")%> 
						</td>
						<td>
							<%=rsd.getString("chp3")%> 
						</td>
						
					</tr>
					<tr class="info">
						<td>
							温度（℃）
						</td>
						<td>
							<%=rs.getString("chp4")%> 
						</td>
							<td>
							<%=rs10.getString("chp4")%> 
						</td>
						<td>
							<%=rsh.getString("chp4")%> 
						</td>
						<td>
							<%=rsd.getString("chp4")%> 
						</td>
						
					</tr>
					<tr class="success">
						<td>
							粉尘（mg/m3）
						</td>
												<td>
						<% if(Float.valueOf(rs.getString("chp5"))>Float.valueOf(rsv.getString("dust")))
						{
							%>	
							<font color="red"><%=rs.getString("chp5")%>
							<%
							
						}
						else
						{
							%>	
							<%=rs.getString("chp5")%>
							<%
							
						}
						%>

						</td>
						
						<td>
							<% if(Float.valueOf(rs10.getString("chp5"))>Float.valueOf(rsv.getString("dust")))
						{
							%>	
							<font color="red"><%=rs10.getString("chp5")%>
							<%
							
						}
						else
						{
							%>	
							<%=rs10.getString("chp5")%>
							<%
							
						}
						%>

						</td>
						
						
						<td>
						
							<% if(Float.valueOf(rsh.getString("chp5"))>Float.valueOf(rsv.getString("dust")))
						{
							%>	
							<font color="red"><%=rsh.getString("chp5")%>
							<%
							
						}
						else
						{
							%>	
							<%=rsh.getString("chp5")%>
							<%
							
						}
						%>

						</td>
						
						
						<td>
						
							<% if(Float.valueOf(rsd.getString("chp5"))>Float.valueOf(rsv.getString("dust")))
						{
							%>	
							<font color="red"><%=rsd.getString("chp5")%>
							<%
							
						}
						else
						{
							%>	
							<%=rsd.getString("chp5")%>
							<%
							
						}
						%>

						</td>
						
					</tr>
					<tr class="warning">
						<td>
							流速(m/s)
						</td>
						<td>
							<%=rs.getString("chp6")%> 
						</td>
							<td>
							<%=rs10.getString("chp6")%> 
						</td>
						<td>
							<%=rsh.getString("chp6")%> 
						</td>
						<td>
							<%=rsd.getString("chp6")%> 
						</td>
						
					</tr>
				</tbody>
			</table>
		
		</div>
		
	</div>
</div>
<%

}
conn.close();
%>