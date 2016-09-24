<%@ page import="java.sql.*" %>
<%@ page import="cmpe283Project.CloudManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>List VMs</title>
     </head>
<body >
</br>
</br>
<%
    if(session.getAttribute("userName") == null) {
        response.sendRedirect("error.jsp?error=No session.. You must login to see the page");
    }
%>
<div id="bar">  <h4 style="float:left">Welcome!</h4><p style="color:white;font-family:Arial;margin:15px 0px 0px 580px;">CMPE-283 Project1</p></div>
 <a href="logout.jsp" class="formdesc" style="margin-left:1190px;margin-top:70px;color:black">Logout!</a>
<div id="main">
    <div class="row vcenter">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Listed Virtual Machines</h4>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <%! String userName;
                                String vmName;
                            %>
                            <%
                                Connection con= null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;

                                String driverName = "com.mysql.jdbc.Driver";
                                String url = "jdbc:mysql://localhost:3306/cmpe283";
                                String user = "root";
                                String dbpsw = "password";

                                String usrName = request.getParameter("userName");
                                //String usrName = (String) session.getAttribute("userName");
                                System.out.println("Name of the user for listing VMS: " + usrName);
                                String powerStats = "";
                                String sql = "select * from vm_users where userName=?";
                                try {
                                    Class.forName(driverName);
                                    con = DriverManager.getConnection(url, user, dbpsw);
                                    ps = con.prepareStatement(sql);
                                    ps.setString(1, usrName);
                                    rs = ps.executeQuery();
                                    while(rs.next())
                                    {
                                        userName = rs.getString("userName");
                                        System.out.println("Retrieved Name of the user for listing VMS: " + userName);
                                        vmName = rs.getString("vmName");
                                        if(usrName.equals(userName))
                                        {
                                            powerStats = CloudManager.getPowerStatus(vmName);
                                            if(powerStats != null) {
                                                out.println("<label class='list' style='margin:20px 0px 0px 50px; '><i>VM Name:</i> "+ vmName + "&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <i>Power Status:</i> "+ powerStats +"</label></br>");
                                            }
                                        }
                                    }
                                    rs.close();
                                    ps.close();
                                }
                                catch(Exception sqe)
                                {
                                    out.println(sqe);
                                }
                            %>
                        </div>
                    </form>
                </div>
                <div class="panel-footer clearfix">
                    <div class="formdesc">
                        <a href="welcome.jsp" class="formdesc">Home</a>
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
    width: 600px !important;
    padding: 50px 0px 0px 80px;
    border-radius:100px;
    height:300px;
    margin: 150px 0px 0px 350px;
}

.formdesc{

    font:Arial;
    color:white;
    font-size: 20px;
    margin-top: 10px;
    text-decoration:none;
    margin-top:50px;
    margin-left:90px;	
}


.forminp{

    font:Arial; 
    font-size: 20px;
    border: 2px ridge rgba(255,153,0,0.9);
}
.list{
margin-top:10px;
}
 
</style>
</body>
</html>
