<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<html>
<head>
<title>JavaMail 电子邮件发送系统</title>
</head>
<body>

<%
// 以下变量为用户根据自己的情况设置
String smtphost = "smtp.sina.com"; // 发送邮件服务器
String user = "mydisk2014@sina.cn"; // 邮件服务器登录用户名
String password = "lxg781228"; // 邮件服务器登录密码
String from ="mydisk2014@sina.cn"; // 发送人邮件地址
String to ="3259407@qq.com"; // 接受人邮件地址
String to1 ="3324851586@qq.com"; // 接受人邮件地址
String subject = "JavaMail 电子邮件发送系统测试"; // 邮件标题
String body = "JavaMail 电子邮件发送系统"; // 邮件内容



// 以下为发送程序，用户无需改动
try {

Properties props = new Properties();
props.put("mail.smtp.host", smtphost);
props.put("mail.smtp.auth","true");
for(int i=0;i<2;i++)
{
Session ssn = Session.getInstance(props, null);

MimeMessage message = new MimeMessage(ssn);
InternetAddress fromAddress = new InternetAddress(from);
message.setFrom(fromAddress);
InternetAddress toAddress;
if(i==0)
{
toAddress = new InternetAddress(to);
InternetAddress toAddress1 = new InternetAddress(to1);
}
else
{
toAddress = new InternetAddress(to1);
}
message.addRecipient(Message.RecipientType.TO, toAddress);
message.setSubject(subject);
message.setText(body);
Transport transport = ssn.getTransport("smtp");
transport.connect(smtphost, user, password);
transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
transport.close();
}

%><p>你的邮件已发送，请返回。</p><%
} catch(Exception m) {
out.println(m.toString());
m.printStackTrace();
}%>
</BODY>
</HTML>