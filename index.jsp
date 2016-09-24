<%@ page import="com.mysql.jdbc.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>Login</title>
    </head>
<body>
</br>
</br>
<%
    if(session.getAttribute("userName") != null) {
        session.removeAttribute("userName");
    }
%>
<div id="bar">  <h4 style="float:left">Welcome!</h4><p style="color:white;font-family:Arial;margin:15px 0px 0px 580px;">CMPE-283 Project1</p> <a href="signup.jsp" class="sgup" >Sign Up?</a></div>

<div id="main">
    <div class="row vcenter">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Login</h4>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="home.jsp">
                        <div class="form-group">
                            <label for="username" class="col-lg-2 control-label">Username</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="username" name="userName" placeholder="" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                            <div class="col-md-4">
                                <input type="password" class="form-control" id="inputPassword" name="passWord" placeholder="" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-3">
                                <button type="submit" class="btn btn-primary">Log In</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-footer clearfix">
                     
                </div>
            </div>
        </div>
    </div>
</div> </body>

<style type="text/css">

body{


    background-color:rgba(255,153,0,0.9);
}

#bar{


    height: 30px;
    width:1300px;
    background-color: rgba(0,0,0,0.9);
    border: 5px ridge black;
    padding-bottom: 10px;
    margin-top:-50px;
    margin-left:-10px
}


h4{

    color: white; 
    margin-left:10px;
}

#main{

    
    border: 3px ridge rgba(255,153,0,0.9);
    background-color: rgba(0,0,0,0.5);
    width: 300px !important;
    padding: 50px 0px 0px 80px;
    border-radius:100px;
    height:300px;
    margin: 180px 0px 0px 450px;
}

.formdesc{

    font:Arial;
    color:white;
    font-size: 20px;
    margin-top: 10px;
}


.forminp{

    font:Arial; 
    font-size: 20px;
    border: 2px ridge rgba(255,153,0,0.9);
}

.form-group{

    margin-top: 20px;
}

.lgin{

    width: 80px;
    height: 30px;
    color:black;
    margin:20px 0px 0px 70px;
 
}

.sgup{
	
	text-decoration:none;
	color:black;
	font-weight:100px !important;
	margin-top:20px;
	float:right;
	margin-right:30px;

}

</style>
</html>
