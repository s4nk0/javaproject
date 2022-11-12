<%@ page import="com.example.javaproject.models.Events" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Intel
  Date: 30.04.2022
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/header.jsp">
    <jsp:param name="pageActive" value="/events" />
</jsp:include>
<%
    List<Events> events = (List<Events>) session.getAttribute("events");
    String limit = (String) session.getAttribute("limit");
    int limitConst = (Integer) session.getAttribute("limitConst");
%>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <h2>Events Latest</h2>
                    <div class="bt-option">
                        <a href="#">Home</a>
                        <span>Our Events</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Blog Section Begin -->
<section class="blog-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-md-6">
                        <div class="blog-item set-bg" data-setbg="main/img/blog/blog-1.jpg">
                            <div class="bi-tag bg-gradient"><%=events.get(0).getTitle()%></div>
                            <div class="bi-text">
                                <h5><a href="./blog-details.html"><%=events.get(0).getDescription()%></a></h5>
                                <span><i class="fa fa-clock-o"></i> <%=events.get(0).getStart_date()%></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="blog-item set-bg" data-setbg="main/img/blog/blog-2.jpg">
                            <div class="bi-tag bg-gradient"><%=events.get(1).getTitle()%></div>
                            <div class="bi-text">
                                <h5><a href="./blog-details.html"><%=events.get(1).getDescription()%></a></h5>
                                <span><i class="fa fa-clock-o"></i> <%=events.get(1).getStart_date()%></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="blog-item set-bg large-item" data-setbg="main/img/blog/blog-4.jpg">
                    <div class="bi-tag bg-gradient"><%=events.get(2).getTitle()%></div>
                    <div class="bi-text">
                        <h3><a href="./blog-details.html"><%=events.get(2).getDescription()%></a></h3>
                        <span><i class="fa fa-clock-o"></i> <%=events.get(2).getStart_date()%></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="blog-item set-bg" data-setbg="main/img/blog/blog-7.jpg">
                            <div class="bi-tag bg-gradient"><%=events.get(3).getTitle()%></div>
                            <div class="bi-text">
                                <h5><a href="./blog-details.html"><%=events.get(3).getDescription()%></a></h5>
                                <span><i class="fa fa-clock-o"></i> <%=events.get(3).getStart_date()%></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="blog-item set-bg" data-setbg="main/img/blog/blog-8.jpg">
                            <div class="bi-tag bg-gradient"><%=events.get(4).getTitle()%></div>
                            <div class="bi-text">
                                <h5><a href="./blog-details.html"><%=events.get(4).getDescription()%></a></h5>
                                <span><i class="fa fa-clock-o"></i> <%=events.get(4).getStart_date()%></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="blog-item set-bg large-item" data-setbg="main/img/blog/blog-3.jpg">
                    <div class="bi-tag bg-gradient"><%=events.get(5).getTitle()%></div>
                    <div class="bi-text">
                        <h3><a href="./blog-details.html"><%=events.get(5).getDescription()%></a></h3>
                        <span><i class="fa fa-clock-o"></i> <%=events.get(5).getStart_date()%></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="blog-item set-bg" data-setbg="main/img/blog/blog-5.jpg">
                            <div class="bi-tag bg-gradient"><%=events.get(6).getTitle()%></div>
                            <div class="bi-text">
                                <h5><a href="./blog-details.html"><%=events.get(6).getDescription()%></a></h5>
                                <span><i class="fa fa-clock-o"></i> <%=events.get(6).getStart_date()%></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="blog-item set-bg" data-setbg="main/img/blog/blog-6.jpg">
                            <div class="bi-tag bg-gradient"><%=events.get(7).getTitle()%></div>
                            <div class="bi-text">
                                <h5><a href="./blog-details.html"><%=events.get(7).getDescription()%></a></h5>
                                <span><i class="fa fa-clock-o"></i> <%=events.get(7).getStart_date()%></span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="blog-item set-bg" data-setbg="main/img/blog/blog-9.jpg">
                    <div class="bi-tag bg-gradient"><%=events.get(8).getTitle()%></div>
                    <div class="bi-text">
                        <h3><a href="./blog-details.html"><%=events.get(8).getDescription()%></a></h3>
                        <span><i class="fa fa-clock-o"></i> <%=events.get(8).getStart_date()%></span>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="row">
                    <% if (events.size() > limitConst) {
                        for (int i = limitConst; i < events.size(); i ++){ %>
                    <div class="col-md-3">
                        <div class="blog-item set-bg" data-setbg="main/img/blog/blog-6.jpg">
                            <div class="bi-tag bg-gradient"><%=events.get(i).getTitle()%></div>
                            <div class="bi-text">
                                <h5><a href="./blog-details.html"><%=events.get(i).getDescription()%></a></h5>
                                <span><i class="fa fa-clock-o"></i> <%=events.get(i).getStart_date()%></span>
                            </div>
                        </div>
                    </div>
                    <% }
                    }
                    %>
                </div>
            </div>
        </div>

        <form action="/events" method="post">
            <input type="text" class="d-none" name="load_more" value="<%=limit%>" readonly>
            <button type="submit" class="primary-btn border-0"><%=limit%></button>
        </form>

    </div>
</section>
<!-- Blog Section End -->

<jsp:include page="includes/footer.jsp"/>