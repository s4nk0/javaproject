<%@ page import="com.example.javaproject.models.Events" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.javaproject.models.Event_type" %>
<%@ page import="com.example.javaproject.models.Payment_type" %>
<%@ page import="com.example.javaproject.models.Employee_type" %>
<%@ page import="com.example.javaproject.services.EventsService" %>
<%@ page import="com.example.javaproject.services.Fee_scheduleService" %>
<%@ page import="com.example.javaproject.services.EmployeeService" %><%--
  Created by IntelliJ IDEA.
  User: Intel
  Date: 02.05.2022
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="includes/header.jsp">
    <jsp:param name="pageActive" value="admin/settings" />
    <jsp:param name="pageName" value="Settings" />


</jsp:include>

<%
    List<Event_type> event_types = (List<Event_type>) session.getAttribute("event_types");
    List<Payment_type> payment_types = (List<Payment_type>) session.getAttribute("payment_types");
    List<Employee_type> employee_types = (List<Employee_type>) session.getAttribute("employee_types");
%>
<div id="result_form"></div>
<div class="row">


    <div class="col-lg-6">

        <!-- Dropdown Card Example -->
        <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Event types</h6>
                <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                        <div class="dropdown-header">Dropdown Header:</div>
                        <a class="dropdown-item event_type_add" href="#">Add</a>
<%--                        <a class="dropdown-item" href="#">Another action</a>--%>
<%--                        <div class="dropdown-divider"></div>--%>
<%--                        <a class="dropdown-item" href="#">Something else here</a>--%>
                    </div>
                </div>
            </div>
            <!-- Card Body -->
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item text-dark"><div class="row">
                        <div class="col-lg-4">Name</div>
                        <div class="col-lg-4 text-right">Price</div>
                        <div class="col-lg-4 text-right">Action</div>
                    </div>
                    </li>
                    <%
                        for (Event_type event_type : event_types){%>
                    <li class="list-group-item text-dark">
                        <div class="row">
                            <div class="col-lg-4"><%=event_type.getName()%></div>
                            <div class="col-lg-4 text-right"><%=event_type.getPrice()%> $</div>
                            <div class="col-lg-4 text-right">
                                <%  int count = EventsService.getEventTypeCountByIdInEvents(event_type.getId());
                                    if (count == 0){%>
                                <form class="d-inline" action="/admin/deleteEventType" method="post">
                                    <input class="d-none" type="text" name="id" value="<%=event_type.getId()%>" readonly/>
                                    <button class="btn btn-link text-danger " type="submit"><i class="fas fa-trash-alt"></i></button>
                                </form>

                                <%}
                                %>
                                <i class="fas fa-edit  edit_event_type text-warning btn" data-id="<%=event_type.getId()%>"></i>


                            </div>
                        </div>

                    </li>
                    <%}
                    %>
                </ul>
            </div>
        </div>


    </div>

    <div class="col-lg-6">

        <!-- Dropdown Card Example -->
        <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Payment types</h6>
                <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                        <div class="dropdown-header">Dropdown Header:</div>
                        <a class="dropdown-item payment_type_add" href="#">Add</a>
<%--                        <a class="dropdown-item" href="#">Another action</a>--%>
<%--                        <div class="dropdown-divider"></div>--%>
<%--                        <a class="dropdown-item" href="#">Something else here</a>--%>
                    </div>
                </div>
            </div>
            <!-- Card Body -->
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item text-dark"><div class="row">
                        <div class="col-lg-6">Name</div>
                        <div class="col-lg-6 text-right">Action</div>
                    </div>
                    </li>

                    <%
                        for (Payment_type payment_type : payment_types){%>
                    <li class="list-group-item text-dark">
                        <div class="row">
                            <div class="col-lg-6"><%=payment_type.getName()%></div>
                            <div class="col-lg-6 text-right">
                                <%  int count = Fee_scheduleService.getPaymentTypeCountByIdInFeeSchedule(payment_type.getId());
                                    if (count == 0){%>
                                <form class="d-inline" action="/admin/deletePaymentType" method="post">
                                    <input class="d-none" type="text" name="id" value="<%=payment_type.getId()%>" readonly/>
                                    <button class="btn btn-link text-danger " type="submit"><i class="fas fa-trash-alt"></i></button>
                                </form>

                                <%}
                                %>
                                <i class="fas fa-edit  edit_payment_type text-warning btn" data-id="<%=payment_type.getId()%>"></i>

                            </div>
                        </div>
                    </li>
                    <%}
                    %>
                </ul>
            </div>
        </div>


    </div>


</div>

<div class="row">

    <div class="col-lg-6">

        <!-- Dropdown Card Example -->
        <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Employee types</h6>
                <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                        <div class="dropdown-header">Dropdown Header:</div>
                        <a class="dropdown-item employee_type_add" href="#">Add</a>
<%--                        <a class="dropdown-item" href="#">Another action</a>--%>
<%--                        <div class="dropdown-divider"></div>--%>
<%--                        <a class="dropdown-item" href="#">Something else here</a>--%>
                    </div>
                </div>
            </div>
            <!-- Card Body -->
            <div class="card-body">

                <ul class="list-group list-group-flush">
                    <li class="list-group-item text-dark"><div class="row">
                        <div class="col-lg-4">Name</div>
                        <div class="col-lg-4 text-right">Fee</div>
                        <div class="col-lg-4 text-right">Action</div>
                    </div>
                    </li>
                    <%
                        for (Employee_type employee_type : employee_types){%>
                    <li class="list-group-item text-dark">
                        <div class="row">
                            <div class="col-lg-4"><%=employee_type.getName()%></div>
                            <div class="col-lg-4 text-right"><%=employee_type.getFee()%> $</div>
                            <div class="col-lg-4 text-right">
                                <%  int count = EmployeeService.getEmployeeTypeCountByIdInEmployee(employee_type.getId());
                                    if (count == 0){%>
                                <form class="d-inline" action="/admin/deleteEmployeeType" method="post">
                                    <input class="d-none" type="text" name="id" value="<%=employee_type.getId()%>" readonly/>
                                    <button class="btn btn-link text-danger " type="submit"><i class="fas fa-trash-alt"></i></button>
                                </form>

                                <%}
                                %>
                                <i class="fas fa-edit  edit_employee_type text-warning btn" data-id="<%=employee_type.getId()%>"></i>

                            </div>
                        </div>
                    </li>
                    <%}
                    %>
                </ul>
            </div>
        </div>


    </div>
</div>
<!-- Modal -->
<div class="modal modal_setting_page fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog w-100" role="document">
        <div class="modal-content px-3">
            <div class="modal-header">
                <h5 class="modal-title text-primary" id="exampleModalLabel" ><b class="modal-title-text"></b></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp"/>

