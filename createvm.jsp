<%@ page import="cmpe283Project.CloudManager" %>
<%@ page import="com.mysql.jdbc.StringUtils" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>Create VM</title>
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
                     
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <%
                                String vmName1 = request.getParameter("vmName");
                                String vmName2 = request.getParameter("vmName1");
                                String disksize = request.getParameter("diskSize");
                                String selectos = request.getParameter("selectOS");
                                String ramsize = request.getParameter("ramSize");
                                String ostype = request.getParameter("ostype");
                                String userName = session.getAttribute("userName").toString();
                                boolean isCreated = false;
                                Connection con;
                                PreparedStatement ps;
                                String driverName = "com.mysql.jdbc.Driver";
                                String url = "jdbc:mysql://localhost:3306/cmpe283";
                                String user = "root";
                                String dbpsw = "password";
                                String sql = "insert into vm_users values(?,?)";
                                if(StringUtils.isNullOrEmpty(vmName2) && disksize.equalsIgnoreCase("noSel") &&
                                        ramsize.equalsIgnoreCase("noSel") && ostype.equalsIgnoreCase("noSel")) {
                                    if(!(StringUtils.isNullOrEmpty(vmName1)) && !(selectos.equalsIgnoreCase("noSel"))) {
                                        if(selectos.equalsIgnoreCase("winOS")) {
                                            vmName1 = vmName1 + "-Win";
                                        }
                                        else {
                                            vmName1 = vmName1 + "-Ubu";
                                        }
                                        isCreated = CloudManager.myVMCreation(vmName1);
                                    }
                                    else {
                                        response.sendRedirect("error.jsp?error=Give all details before clicking on Create VM");
                                    }
                                }
                                else {
                                    if(!(StringUtils.isNullOrEmpty(vmName2)) && !(disksize.equalsIgnoreCase("noSel")) &&
                                            !(ramsize.equalsIgnoreCase("noSel")) && !(ostype.equalsIgnoreCase("noSel"))) {
                                        long tempDisk = Long.parseLong(disksize);
                                        long ramDisk = Long.parseLong(ramsize);
                                        isCreated = CloudManager.myScratchVMCreation(vmName2,tempDisk,ramDisk);
                                    }
                                    else {
                                       response.sendRedirect("error.jsp?error=Give all details before clicking on Create VM");
                                    }
                                }
                                if(isCreated) {
                                    out.print("<label class=\"col-lg-2 control-label\" id=\"errorLabel\"><h2><i style='color:white'>Success ! </i></h2> your virtual machine has been deployed.");
                                }
                                else {
                                    out.print("<label class=\"col-lg-2 control-label\" id=\"errorLabel\"><h2><i style='color:white'>Oops ! </i></h2> something went wrong.</label>");
                                }
                                if(isCreated) {
                                    try {
                                        Class.forName(driverName);
                                        con = DriverManager.getConnection(url, user, dbpsw);
                                        ps = con.prepareStatement(sql);
                                        ps.setString(1, userName);
                                        if(isCreated) {
                                            ps.setString(2, vmName2);
                                        }
                                        else {
                                            ps.setString(2, vmName1);
                                        }
                                        ps.executeUpdate();
                                        ps.close();
                                    }
                                    catch(Exception sqe)
                                    {
                                        out.println(sqe);
                                    }
                                }
                            %>
                        </div>
                    </form>
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
 
 

</style>
</body>
</html>
