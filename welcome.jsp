<%@ page import="cmpe283Project.CloudManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>Welcome</title>
     <script type="text/javascript">
        function sendSession() {
            window.location.href = "listvms.jsp?userName=<%=session.getAttribute("userName")%>";
        }
    </script>
</head>
<div id="bar"><h4 style="float:left;color:white">Welcome <%=session.getAttribute("userName")%></h4><p style="color:white;font-family:Arial;margin:15px 0px 0px 580px;">CMPE-283 Project1</p></div>
<a href="logout.jsp" class="formdesc" style="text-decoration:none;color:white;margin-left:1200px">Logout</a>
<body>
</br>
</br>
<%
    if(session.getAttribute("userName") == null) {
        response.sendRedirect("error.jsp?error=No session.. You must login to see the page");
    }
%>
<div id="main">
    <div class="row vcenter">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="formdesc" style="margin-left:90px;">
                    <h4 style="color:rgba(0,0,0,0.5)"><u>OPTIONS</u></h4>
                </div>
                 <div class="panel-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="formdesc" onmouseover=cvmd() onmouseout=cvmnd()>
                                Create a Virtual Machine</label>
                            <div class="col-md-4">
                                <a href="createsel.jsp" class="forminp">Create VM</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="formdesc" onmouseover=lvmd() onmouseout=lvmnd()>List my Virtual Machines</label>
                            <div class="col-md-4">
                                <a href="listvms.jsp" class="forminp">List VMs</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="formdesc" onmouseover=vmsd() onmouseout=vmsnd()>Performance Statistics</label>
                            <div class="col-md-4">
                                <a href="perfstats.jsp" class="forminp">Perf Stats</a>
                            </div>
                        </div>
                    </form>
                </div>
                 
            </div>
        </div>
    </div>
</div>

 <div id="cvm">
                        <p style="color:orange"> </br></br></br>Let's you create virtual machines of two of following variants</br></br>1. Windows</br></br>2. Linux.</br>
                        </br>Go for From-Scratch selection if you want to hurry up ! </p>
                        </div>
                        
                        <div id="lvm">
                        <p style="color:orange"> </br></br></br>Enlists all the virtual machines created by you along with the details.</p>
                        </div>
                        
                        <div id="vms">
                        <p style="color:orange"> </br></br></br>Gives the statistical view of all the utilities by your virtual machines in the server.</p>
                        </div>
</body>



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
    height:390px;
    margin: 180px 0px 0px 400px;
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
    background: rgba(0,0,0,0.1);
    text-decoration:none;
    color:black;
    height:10x;
    
}
.col-md-4{
	 margin-top: 10px;
	 padding: 5px 5px 5px 5px;
	 width:150px;
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

#cvm,#lvm,#vms{
    border:2px groove black;
    width:380px;
    height:250px;
    background-color:black;
    position: inline;
    border-radius:60px;
    display:none;
    padding-left:10px;
}
 
 

</style>

<script type="text/javascript">
function cvmd(){
    document.getElementById("cvm").style.display="block";
    document.getElementById("main").style.backgroundImage="url('createvm.jpg')";
    document.getElementById("cvm").style.opacity="1";
    document.getElementById("cvm").style.marginTop="-500px";
     
};

function cvmnd(){
	document.getElementById("cvm").style.marginTop="0px";
	document.getElementById("main").style.backgroundImage="none";
    document.getElementById("cvm").style.opacity="0.3";
    document.getElementById("cvm").style.display="none";
     
};


function lvmd(){
    document.getElementById("lvm").style.display="block";
    document.getElementById("main").style.backgroundImage="url('listvms.png')";
    document.getElementById("lvm").style.opacity="1";
    document.getElementById("lvm").style.marginTop="-500px";
     
};

function lvmnd(){
	document.getElementById("lvm").style.marginTop="0px";
	document.getElementById("main").style.backgroundImage="none";
    document.getElementById("lvm").style.opacity="0.3";
    document.getElementById("lvm").style.display="none";
     
};

function vmsd(){
    document.getElementById("vms").style.display="block";
    document.getElementById("main").style.backgroundImage="url('statistics.jpg')";
    document.getElementById("vms").style.opacity="1";
    document.getElementById("vms").style.marginTop="-500px";
     
};
function vmsnd(){
	document.getElementById("vms").style.marginTop="0px";
	document.getElementById("main").style.backgroundImage="none";
    document.getElementById("vms").style.opacity="0.3";
    document.getElementById("vms").style.display="none";
     
};

</script>
</html>
