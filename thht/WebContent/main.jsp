<%@ page contentType="text/html; charset=utf-8"  language="java" %>
<%@ page import="java.sql.*,javax.sql.DataSource,javax.naming.*"%>
<!doctype html>
<html lang="en"><head>
    <meta charset="utf-8">  
    <title>工艺流程1号塔</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" href=""bootstrap-theme.css">
<script src="jquery/js/jquery-1.12.0.min.js"></script>


</head>
<body>
<div id="main">
</div>
		<script type="text/javascript">
            $(document).ready(function () {
				
				var timerId;
				function timer_work() {
					 $.get("main_getdata.jsp",function(result){
						$("#main").html(result);
					});
					timerId = setTimeout(function(){ timer_work(); },6000);
				}
				timer_work();
            });			 
        </script>
</body>
</html>