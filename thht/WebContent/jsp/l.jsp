<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html style="height: 100%">
   <head>
       <meta charset="utf-8">
	   <link rel="stylesheet" type="text/css" href="bootstrap.css">
       <link rel="stylesheet" href=""bootstrap-theme.css">
       <script src="jquery/js/jquery-1.12.0.min.js"></script>
   </head>
   <body style="height: 100%; margin: 0">

       <div id="test" style="height: 100%" class="container col-xs-12 column">
       
	   </div>
	   
	    
       <script type="text/javascript" src="echarts.min.js"></script>
       <script type="text/javascript" src="echarts-gl.min.js"></script>
       <script type="text/javascript" src="ecStat.min.js"></script>
       <script type="text/javascript" src="dataTool.min.js"></script>
       <script type="text/javascript" src="china.js"></script>
       <script type="text/javascript" src="world.js"></script>
 

       <script type="text/javascript" src="simplex.js"></script>

       <script type="text/javascript">
var dom = document.getElementById("test");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
    title: {
        text: ''
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['NOX(mg/m3)','SO2(mg/m3)','O2(%)','温度(℃)','粉尘(mg/m3)','流速(m/s)']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: []
    },
    yAxis: {
        type: 'value',
        min:0,
        max:150      
    },
    series: [
        {
            name:'NOX(mg/m3)',
            type:'line',
            data:[]
        },
        {
            name:'SO2(mg/m3)',
            type:'line',
            data:[]
        },
        {
            name:'O2(%)',
            type:'line',
            data:[]
        },
        {
            name:'温度(℃)',
            type:'line',
            data:[]
        },
		{
            name:'粉尘(mg/m3)',
            type:'line',
            data:[]
        },
        {
            name:'流速(m/s)',
            type:'line',
            data:[]
        }
    ]
};
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
$(document).ready(function(){
	var timerId;
				function timer_work() {
					$.ajax({
		url: "data.jsp",
		type : "get",
		dataType : "JSON",
		data: {},
		success : function(data) {
	//$.get('data.jsp').done(function (data) {
		   //alert('aa');
				myChart.setOption({
					xAxis: {
						data: data.days
					},
					series: [{
						name: 'NOX(mg/m3)',
						data: data.d1
					},{
						name: 'SO2(mg/m3)',
						data: data.d2
					},{
						name: 'O2(%)',
						data: data.d3
					},{
						name: '温度(℃)',
						data: data.d4
					},{
						name: '粉尘(mg/m3)',
						data: data.d5
					},{
						name: '流速(m/s)',
						data: data.d6
					}]
				});
		}
	});
					timerId = setTimeout(function(){ timer_work(); },3000);
				}
				timer_work();

	

});
       </script>
   </body>
</html>