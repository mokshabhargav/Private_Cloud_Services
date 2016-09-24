<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>Error Page</title>
     </head>
     
       
<div id="bar"><h4 style="float:left;color:white">Welcome <%=session.getAttribute("userName")%></h4><p style="color:white;font-family:Arial;margin:15px 0px 0px 580px;">CMPE-283 Project1</p></div>
 <a href="welcome.jsp" class="formdesc" style="text-decoration:none;color:black;float:left;margin-left:-130px">Home</a>
 <a href="logout.jsp" class="formdesc" style="text-decoration:none;color:white;float:right;margin-right:-130px;">Logout</a>
   
<body> 
</br>
</br>
<div id="main">
    <div class="row vcenter">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Something went wrong</h4>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form">
                        <div class="formdesc">
                            <label style='margin-left: 100px'>Oops!!! There is an error. Error Details: <%=request.getParameter("error")%></label>
                        </div>
                    </form>
                </div>
                <div class="panel-footer clearfix">
                     
                </div>
                </div>
            </div>
        </div>
    </div>
</div>


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
    margin-top:-8px;
    margin-left:-10px
}


h4{

    color: white; 
    margin-left:10px;
}

#main{

    
    border: 3px ridge rgba(255,153,0,0.9);
    background-color: rgba(0,0,0,0.5);
    width: 400px !important;
    padding: 50px 0px 0px 80px;
    border-radius:100px;
    height:300px;
    margin: 0px 0px 0px 400px;
}

.formdesc{

    font:Arial;
    color:white;
    font-size: 20px;
    margin-top: 10px;
    width:200px;
}


.forminp{

    font:Arial; 
    font-size: 15px;
    background: rgba(0,0,0,0.1);
    text-decoration:none;
    color:black;
    height:10x;
    width:200px;
    margin-left:50px;
    
}
.col-md-8{
	 margin-top: 10px;
	 padding: 5px 5px 5px 5px;
	 width:220px;
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

.formgroup{
	width:200px;
}
 
 

</body>
</html>
