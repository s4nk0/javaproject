<%--
  Created by IntelliJ IDEA.
  User: Intel
  Date: 01.05.2022
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/header.jsp">
    <jsp:param name="pageActive" value="admin/dashboard" />
    <jsp:param name="pageName" value="Dashboard" />
</jsp:include>

<jsp:include page="includes/footer.jsp">
    <jsp:param name="addedScripts" value="
    <!-- Page level plugins -->
    <script src='vendor/chart.js/Chart.min.js'></script>

    <!-- Page level custom scripts -->
    <script src='js/demo/chart-area-demo.js'></script>
    <script src='js/demo/chart-pie-demo.js'></script>" />
</jsp:include>