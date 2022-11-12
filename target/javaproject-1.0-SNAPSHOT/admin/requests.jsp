<%@ page import="com.example.javaproject.models.Events" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Intel
  Date: 02.05.2022
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="includes/header.jsp">
    <jsp:param name="pageActive" value="admin/requests" />
    <jsp:param name="pageName" value="Requests" />
    <jsp:param name="addedLink" value="<link href='vendor/datatables/dataTables.bootstrap4.min.css' rel='stylesheet'>" />

</jsp:include>

<%
    List<Events> requests = (List<Events>) session.getAttribute("requests");

%>

 <!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Last requests</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Location</th>
                    <th>Event type</th>
                    <th>Payment type</th>
                    <th>Start date</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Location</th>
                    <th>Event type</th>
                    <th>Payment type</th>
                    <th>Start date</th>
                </tr>
                </tfoot>
                <tbody>
                <%
                    for (Events request_info : requests){%>
                    <tr>
                        <td><a href="./request_info?id=<%=request_info.getId()%>"><%=request_info.getId()%></a></td>
                        <td><%=request_info.getTitle()%></td>
                        <td><%=request_info.getLocation()%></td>
                        <td><%=request_info.getEvent_type().getName()%></td>
                        <td><%=request_info.getFee_schedule().getPayment_type().getName()%></td>
                        <td>

                            <%=request_info.getStart_date()%></td>
                    </tr>
                    <%}
                %>

                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:include page="includes/footer.jsp">
    <jsp:param name="addedScripts" value="
    <!-- Page level plugins -->
    <script src='vendor/datatables/jquery.dataTables.min.js'></script>
    <script src='vendor/datatables/dataTables.bootstrap4.min.js'></script>
    <!-- Page level custom scripts -->
    <script src='js/demo/datatables-demo.js'></script>" />
</jsp:include>