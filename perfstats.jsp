<%@ page import="cmpe283Project.CloudManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>Performance Statistics</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootswatch/3.2.0/paper/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script src="https://www.google.com/jsapi"></script>
    <script src="js/jquery.csv-0.71.js"></script>
    <script>
        google.load("visualization", "1", {packages:['corechart']});
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            // grab the CSV
            $.get("test.csv", function(csvString) {
                // transform the CSV string into a 2-dimensional array
                var arrayData = $.csv.toArrays(csvString, {onParseValue: $.csv.hooks.castToScalar});
                var data = new google.visualization.arrayToDataTable(arrayData);
                var view1= new google.visualization.DataView(data);
                var view2= new google.visualization.DataView(data);
                view1.setColumns([0,5]);
                view2.setColumns([0,3]);
                var options1 = {
                    title: "Memory-Usage",
                    height:230,
                    width:500,
                    is3D:true,
                    pieHole: 0.4,
                    'backgroundColor':{'fill':'none'}
                };

                var options2 = {
                    title: "CPU-Usage",
                    height:230,
                    width:500,
                    is3D:true,
                    bars: 'horizontal',
                    'backgroundColor':{'fill':'none'}
                };
                var chart1 = new google.visualization.PieChart(document.getElementById('Chart_m'));
                chart1.draw(view1, options1);

                var chart2 = new google.visualization.BarChart(document.getElementById('Chart_c'));
                chart2.draw(view2, options2);
            });
        }
    </script>
</head>
<body background="images/backgroundPic.jpg">
<style type="text/css">
    #Chart_c,#Chart_m {
        height:230px;
        width:500px;
        position: center;
        margin: 50px 10px 0 125px;
        border: 2px ridge black;
        background-color: rgba(255,255,255,0.5);
    }

    #main {
        background-repeat: no-repeat;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        height: 650px;
        width: 760px;
        border:2px solid #dddddd;
        background-color: rgba(245, 245, 245, 1);
    }

    #hold {
        width: 750px;
        height: 680px;
        margin-left: -20px;
        margin-top: -20px;
    }
</style>
</br>
</br>
<%
    if(session.getAttribute("userName") == null) {
        response.sendRedirect("error.jsp?error=No session.. You must login to see the page");
    }
%>
<div class="container">
    <div class="row vcenter">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Performance Statistics</h4>
                    <%
                        CloudManager.getPerfStats();
                    %>
                </div>
                <div class="panel-body">
                    <div id="hold">
                        <div id="main">
                            <div id="Chart_c"></div>
                            <div id="Chart_m"></div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer clearfix">
                    <div class="pull-left">
                        <a href="welcome.jsp" class="btn btn-primary">Go Back to Home?</a>
                    </div>
                    <div class="pull-right">
                        <a href="logout.jsp" class="btn btn-primary">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
