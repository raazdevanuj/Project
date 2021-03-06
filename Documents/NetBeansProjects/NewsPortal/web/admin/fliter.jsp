

<%@page import="com.beans.Reporter"%>
<%@page import="com.daos.ReporterDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.Category"%>
<%@page import="com.daos.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Dashboard</title>
  <jsp:include page="base.jsp"></jsp:include>
  
  <script>
     function select(x,y,z){
       var val1=x.options[x.selectedIndex].value;
       var val2=y.options[y.selectedIndex].value;
       //alert(val2);
       
       
     ajax=new XMLHttpRequest();
     
     ajax.open("GET","../NewsController?op=filter&rid="+val1+"&cid="+val2,true);
     ajax.send();
     ajax.onreadystatechange=function(){
       if(this.readyState==4 && this.status==200)
       z.innerHTML=this.responseText;
     };
    
    }
    </script>
</head>

<body id="page-top">
    <%
        if(session.getAttribute("admin")==null)
        {
            response.sendRedirect("../login.jsp");
            return;
        }
        %>
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
  <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
      <jsp:include page="topbar.jsp"></jsp:include>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
            <h2> Reporter Based News </h2>
          <!-- Page Heading -->
           <table class="table">
                <tr>
                    
                    <td>
                        <select class="form-control" id="rid" onchange="select(this,cid,tab)">
                    <option value="-1">select Reporter</option> 
                        <%
                            ReporterDao rd =new ReporterDao();
                          ArrayList<Reporter> catee =rd.getAllRecords();
                          for(Reporter cat:catee){
                        %>
                        <option value="<%=cat.getId()%>"><%=cat.getName()%></option>
                        <%} %>
                        </select>
                        
                    </td>
                     <td></td>
                    <td>
                        <select class="form-control" id="cid" onchange="select(rid,this,tab)">
                    <option value="-1">select category</option> 
                        <%
                        CategoryDao cd= new CategoryDao();
                          ArrayList<Category> cate =cd.getAllRecords();
                          for(Category cat:cate){
                        %>
                        <option value="<%=cat.getId()%>"><%=cat.getName()%></option>
                        <%} %>
                        </select>
              </tr>   
    
          </table>
                        <br>
                         <table  id="tab" class="table">
              <tr>
                  <td>Title</td>
                  <td>Uploaded By </td>
                  <td>Uploaded On</td>
                  <td>Status</td>
                  <td>View and Change Status</td>
              </tr>
              
         
          </table>
          
          
          
          
          <!-- Content Row -->
          

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <jsp:include page="footer.jsp"></jsp:include>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="signout.jsp">Log out</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Custom scripts for all pages-->
  <script src="assets/js/sb-admin-2.min.js"></script>

  
</body>

</html>
