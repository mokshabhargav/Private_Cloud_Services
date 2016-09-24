<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>Selection</title>
    <script type="text/javascript">
        function setDisplay() {
            if(document.getElementById("template").checked) {
                document.getElementById("vmname1").value = "";
                document.getElementById("disksize").value = "noSel";
                document.getElementById("ramsize").value = "noSel";
                document.getElementById("osType").value = "noSel";
                document.getElementById("scratchSel").style.display = "none";
                document.getElementById("tempSel").style.display = "block";
            }
            else if(document.getElementById("scratch").checked) {
                document.getElementById("vmname").value = "";
                document.getElementById("selOS").value = "noSel";
                document.getElementById("tempSel").style.display = "none";
                document.getElementById("scratchSel").style.display = "block";
            }
        }
    </script>
</head>

<div id="bar"><h4 style="float:left;color:white">Welcome <%=session.getAttribute("userName")%></h4><p style="color:white;font-family:Arial;margin:15px 0px 0px 580px;">CMPE-283 Project1</p></div>
 <a href="welcome.jsp" class="formdesc" style="text-decoration:none;color:black;float:left;margin-left:-130px">Home</a>
 <a href="logout.jsp" class="formdesc" style="text-decoration:none;color:white;float:right;margin-right:-130px;">Logout</a>
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
                <div class="panel-heading">
                    <h4>Choice of creation</h4>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="createvm.jsp">
                        <div class="col-md-4">
                            <input type="radio" name="groupSelect" value="From Template" required id="template" onclick="setDisplay()">Create using Template
                        </div>
                        <div class="col-md-4">
                            <input type="radio" name="groupSelect" value="From Scratch" required id="scratch" onclick="setDisplay()">Create from Scratch
                        </div>
                        </br>
                        </br>
                        <div id="tempSel" style="display: none">
                            <div class="form-group">
                                <label for="vmname" class="formdesc">Name your virtual machine</label>
                                <div class="col-md-8">
                                    <input type="text" class="forminp" id="vmname" name="vmName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="selOS" class="formdesc">Operating System</label>
                                <div class="col-md-8">
                                    <select class="forminp" id="selOS" name="selectOS">
                                        <option value="noSel">-Select desired Operating System-</option>
                                        <option value="winOS">WindowsServer 2008 R2 SP2</option>
                                        <option value="linuxOS">Ubuntu LTS 10.04</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div id="scratchSel" style="display: none">
                            <div class="form-group">
                                <label for="vmname1" class="formdesc">VM Name</label>
                                <div class="col-md-8">
                                    <input type="text" class="forminp" id="vmname1" name="vmName1" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="disksize" class="formdesc">DiskSpace</label>
                                <div class="col-md-8">
                                    <select class="forminp" id="disksize" name="diskSize">
                                        <option value="noSel">-Select-</option>
                                        <option value="5000000">5GB</option>
                                        <option value="7500000">7.5GB</option>
                                        <option value="10000000">10GB</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="ramsize" class="formdesc">Memory Size(RAM)</label>
                                <div class="col-md-8">
                                    <select class="forminp" id="ramsize" name="ramSize">
                                        <option value="noSel">-Select-</option>
                                        <option value="512">512 MB</option>
                                        <option value="1024">1024 MB</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="osType" class="formdesc">Operating System</label>
                                <div class="col-md-8">
                                    <select class="forminp" id="osType" name="ostype">
                                        <option value="noSel">-Select-</option>
                                        <option value="winOS">WindowsServer 2008 R2 SP2</option>
                                        <option value="linuxOS">Ubuntu LTS 10.04</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-3">
                                <button type="submit" class="forminp" style="border-radius:20px;width:100px;margin-left:100px">Create</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-footer clearfix">
                    <div class="pull-left">
                        
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
    height:650px;
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
 
 

</style>
</body>
</html>
