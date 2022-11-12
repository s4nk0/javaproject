<%@ page import="com.example.javaproject.models.Events" %>
<%@ page import="com.example.javaproject.models.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Intel
  Date: 02.05.2022
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/header.jsp">
    <jsp:param name="pageActive" value="admin/requests" />
    <jsp:param name="pageName" value="Requests - info" />
    <jsp:param name="addedLink" value="<link href='vendor/datatables/dataTables.bootstrap4.min.css' rel='stylesheet'>" />
</jsp:include>
<%
    Events request_info = (Events) session.getAttribute("request");
    if (request_info.getId().equals("")){%>
        <h2>You have not selected a request!</h2>
    <%} else{
        List<Employee> employees = (List<Employee>) session.getAttribute("employees");
%>

<div class="row">

    <div class="col-lg-6">
        <!-- Circle Buttons -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Event info</h6>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-between py-1">
                    <div><strong>ID:</strong></div>
                    <div><%=request_info.getId()%></div>
                </div>

                <div class="d-flex justify-content-between py-1">
                    <div><strong>Title:</strong></div>
                    <div><%=request_info.getTitle()%></div>
                </div>

                <div class="py-1 border-bottom pb-2">
                    <div><strong>Description:</strong></div>
                    <div><%=request_info.getDescription()%></div>
                </div>

                <div class="d-flex justify-content-between py-1">
                    <div><strong>Location:</strong></div>
                    <div><%=request_info.getLocation()%></div>
                </div>

                <div class="d-flex justify-content-between py-1">
                    <div><strong>Number participants:</strong></div>
                    <div><%=request_info.getNumber_participants()%></div>
                </div>

                <div class="d-flex justify-content-between py-1">
                    <div><strong>Start date:</strong></div>
                    <div><%=request_info.getStart_date()%></div>
                </div>

                <div class="d-flex justify-content-between py-1">
                    <div><strong>End date:</strong></div>
                    <div><%=request_info.getEnd_date()%></div>
                </div>
            </div>
        </div>

        <!-- Brand Buttons -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Event type info</h6>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-between py-1">
                    <div><strong>Id:</strong></div>
                    <div><%=request_info.getEvent_type().getId()%></div>
                </div>
                <div class="d-flex justify-content-between py-1">
                    <div><strong>Name:</strong></div>
                    <div><%=request_info.getEvent_type().getName()%></div>
                </div>
                <div class="py-1 border-bottom pb-2">
                    <div><strong>Description:</strong></div>
                    <div><%=request_info.getEvent_type().getDescription()%></div>
                </div>
                <div class="d-flex justify-content-between py-1">
                    <div><strong>Price:</strong></div>
                    <div><%=request_info.getEvent_type().getPrice()%></div>
                </div>
            </div>
        </div>

    </div>

    <div class="col-lg-6">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Attendees info</h6>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-between py-1">
                    <div><strong>Id:</strong></div>
                    <div><%=request_info.getAttendees().getId()%></div>
                </div>
                <div class="d-flex justify-content-between py-1">
                    <div><strong>Name:</strong></div>
                    <div><%=request_info.getAttendees().getName()%></div>
                </div>
                <div class="d-flex justify-content-between py-1">
                    <div><strong>Phone number:</strong></div>
                    <a href="tel:<%=request_info.getAttendees().getPhone_number().substring(1,request_info.getAttendees().getPhone_number().length())%>"><%=request_info.getAttendees().getPhone_number()%></a>
                </div>
                <div class="d-flex justify-content-between py-1">
                    <div><strong>Email:</strong></div>
                    <a href="mailto:<%=request_info.getAttendees().getEmail()%>"><%=request_info.getAttendees().getEmail()%></a>
                </div>
            </div>
        </div>

        <!-- Circle Buttons -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Fee schedule info</h6>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-between py-1">
                    <div><strong>ID:</strong></div>
                    <div><%=request_info.getFee_schedule().getId()%></div>
                </div>

                <div class="py-1 border-bottom pb-2">
                    <div><strong>User description:</strong></div>
                    <div><%=request_info.getFee_schedule().getUser_description()%></div>
                </div>

                <div class="d-flex justify-content-between py-1">
                    <div><strong>Amount:</strong></div>
                    <div><%=request_info.getFee_schedule().getAmount()%></div>
                </div>

                <div class="d-flex justify-content-between py-1">
                    <div><strong>Date of payment:</strong></div>
                    <div><%=request_info.getFee_schedule().getDate_of_payment()%></div>
                </div>
            </div>
        </div>

        <!-- Brand Buttons -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Payment type Info</h6>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-between py-1">
                    <div><strong>Id:</strong></div>
                    <div><%=request_info.getFee_schedule().getPayment_type().getId()%></div>
                </div>
                <div class="d-flex justify-content-between py-1">
                    <div><strong>Name:</strong></div>
                    <div><%=request_info.getFee_schedule().getPayment_type().getName()%></div>
                </div>
                <div class="py-1 border-bottom pb-2">
                    <div><strong>Description:</strong></div>
                    <div><%=request_info.getFee_schedule().getPayment_type().getDescription()%></div>
                </div>
            </div>
        </div>



    </div>

    <div class="col-lg-12">

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">For accept request select employees for this event</h6>
            </div>
            <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Employee type</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Name</th>
                                <th>Employee type</th>
                                <th></th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <%
                                for (Employee employee : employees){%>
                            <tr>
                                <td><%=employee.getName()%></td>
                                <td><%=employee.getEmployee_type().getName()%></td>
                                <td><input type="checkbox" class="employees_checkbox" data-id="<%=employee.getId()%>"></td>
                            </tr>
                            <%}
                            %>

                            </tbody>
                        </table>
                    </div>

                <div class="py-3"><button class="btn btn-primary accept" data-event_id="<%=request_info.getId()%>">Accept</button></div>
            </div>
        </div>

    </div>

</div>
<%}%>

<jsp:include page="includes/footer.jsp">
    <jsp:param name="addedScripts" value="
    <!-- Page level plugins -->
    <script src='vendor/datatables/jquery.dataTables.min.js'></script>
    <script src='vendor/datatables/dataTables.bootstrap4.min.js'></script>
    <!-- Page level custom scripts -->
    <script src='js/demo/datatables-demo.js'></script>
    <script src='js/request_info_page.js'></script>
"
    />
</jsp:include>
