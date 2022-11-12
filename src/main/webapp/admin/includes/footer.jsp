<%--
  Created by IntelliJ IDEA.
  User: Intel
  Date: 01.05.2022
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String addedScripts = "";
    if (request.getParameter("addedScripts") != null){
        addedScripts = request.getParameter("addedScripts");
    }
%>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2021</span>
        </div>
    </div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

<div style="min-width:300px; bottom: 0; right: 0" role="alert" aria-live="assertive" aria-atomic="true" class="toast position-fixed m-3" data-autohide="true"  data-delay="10000">
    <div class="toast-header">
        <span class="btn-icon-toast">
            <a href="#" class="btn btn-success btn-circle btn-sm mr-2 ">
                <i class="fas fa-check"></i>
            </a>
        </span>
        <strong class="mr-auto toast-title">Bootstrap</strong>
        <small>0 mins ago</small>
        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="toast-body message">
        Hello, world! This is a toast message.
    </div>
</div>

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
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
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<%=addedScripts%>
<script>
    $( document ).ready(function() {
        $(".employee_type_add").on("click", function () {
            $(".modal-title-text").html("Add employee type");
            $(".modal_setting_page .modal-body").html(
                '<form action="/admin/addEmployeeType" method="post">' +
                '<div class="form-group">' +
                '<label for="exampleInputname">Name</label>' +
                '<input type="text" name="name" class="form-control" id="exampleInputname"  placeholder="Enter name"/>' +
                '</div>' +
                '<div class="form-group">' +
                '<label for="exampleInputDescription">Description</label>' +
                '<textarea class="form-control" name="description"  id="exampleInputDescription"  rows="3"></textarea>' +
                '</div>' +
                '<div class="form-group">' +
                '<label for="exampleInputFee">Fee</label>' +
                '<input type="number" name="fee" class="form-control" id="exampleInputFee"  placeholder="Enter fee $"/>' +
                '</div>' +
                '<button type="submit" class="btn btn-primary my-2">Submit</button>'+
                ' </form>'
            );
            $(".modal_setting_page").modal("show");
        });

        $(".payment_type_add").on("click", function () {
            $(".modal-title-text").html("Add payment type");
            $(".modal_setting_page .modal-body").html(
                '<form action="/admin/addPaymentType" method="post">' +
                '<div class="form-group">' +
                '<label for="exampleInputname">Name</label>' +
                '<input type="text" name="name" class="form-control" id="exampleInputname"  placeholder="Enter name"/>' +
                '</div>' +
                '<div class="form-group">' +
                '<label for="exampleInputDescription">Description</label>' +
                '<textarea class="form-control" name="description"  id="exampleInputDescription"  rows="3"></textarea>' +
                '</div>' +
                '<button type="submit" class="btn btn-primary my-2">Submit</button>'+
                ' </form>'
            );
            $(".modal_setting_page").modal("show");
        });

        $(".event_type_add").on("click", function () {
            $(".modal-title-text").html("Add event type");
            $(".modal_setting_page .modal-body").html(
                '<form action="/admin/addEventType"  id="ajax_form">'+
                    '<div class="form-group">'+
                        '<label for="exampleInputname">Name</label>'+
                        '<input type="text" name="name" class="form-control" id="exampleInputname"  placeholder="Enter name"/>'+
                    '</div>'+
                    '<div class="form-group">'+
                        '<label for="exampleInputDescription">Description</label>'+
                        '<textarea class="form-control" name="description"  id="exampleInputDescription"  rows="3"></textarea>'+
                    '</div>'+
                    '<div class="form-group">'+
                        '<label for="exampleInputPrice">Price in $</label>'+
                        '<input type="number" name="price" class="form-control" id="exampleInputPrice"  placeholder="Enter price"/>'+
                    '</div>'+


               ' </form>'+
            '<button class="btn btn-primary submit_form">Submit</button>'
                
            );
           $(".modal_setting_page").modal("show");

            $(".submit_form").on("click", function () {
                var get_url = $("#ajax_form").attr("action");

                sendAjaxForm('result_form', 'ajax_form', get_url);

            });
        });


        $(".edit_employee_type").on("click", function () {

            $.ajax({
                url: "/admin/getDataEmployeeType",
                type: "POST",
                data: ({id: $(this).data("id")}),
                dataType: 'json',
                success: function(list) {
                    console.log(list);
                    $(".modal-title-text").html("Edit event type");
                    $(".modal_setting_page .modal-body").html(
                        '<form action="/admin/editEmployeeType"  method="post">'+
                        '<input name="id" type="text" class="d-none" value="'+list.id+'" readonly/>'+
                        '<div class="form-group">'+
                        '<label for="exampleInputname">Name</label>'+
                        '<input type="text" name="name" class="form-control" id="exampleInputname" value="'+list.name+'" placeholder="Enter name"/>'+
                        '</div>'+
                        '<div class="form-group">'+
                        '<label for="exampleInputDescription">Description</label>'+
                        '<textarea class="form-control" name="description"  id="exampleInputDescription"  rows="3">'+list.description+'</textarea>'+
                        '</div>'+
                        '<div class="form-group">'+
                        '<label for="exampleInputFee">Fee</label>'+
                        '<input type="number" name="fee" class="form-control" id="exampleInputFee" value="'+list.fee+'" placeholder="Enter name"/>'+
                        '</div>'+
                        '<div class="form-group">'+
                        '<button type="submit" class="btn btn-primary my-2">Submit</button>'+

                        '</div>'+


                        ' </form>'

                    );
                    $(".modal_setting_page").modal("show");
                }
            });
        });


        $(".edit_payment_type").on("click", function () {

            $.ajax({
                url: "/admin/getDataPaymentType",
                type: "POST",
                data: ({id: $(this).data("id")}),
                dataType: 'json',
                success: function(list) {
                    console.log(list);
                    $(".modal-title-text").html("Edit event type");
                    $(".modal_setting_page .modal-body").html(
                        '<form action="/admin/editPaymentType"  method="post">'+
                        '<input name="id" type="text" class="d-none" value="'+list.id+'" readonly/>'+
                        '<div class="form-group">'+
                        '<label for="exampleInputname">Name</label>'+
                        '<input type="text" name="name" class="form-control" id="exampleInputname" value="'+list.name+'" placeholder="Enter name"/>'+
                        '</div>'+
                        '<div class="form-group">'+
                        '<label for="exampleInputDescription">Description</label>'+
                        '<textarea class="form-control" name="description"  id="exampleInputDescription"  rows="3">'+list.description+'</textarea>'+
                        '</div>'+
                        '<div class="form-group">'+
                        '<button type="submit" class="btn btn-primary my-2">Submit</button>'+

                        '</div>'+


                        ' </form>'

                    );
                    $(".modal_setting_page").modal("show");
                }
            });
        });


        $(".edit_event_type").on("click", function () {

            $.ajax({
                url: "/admin/getDataEventType",
                type: "POST",
                data: ({id: $(this).data("id")}),
                dataType: 'json',
                success: function(list) {
                    console.log(list);
                    $(".modal-title-text").html("Edit event type");
                    $(".modal_setting_page .modal-body").html(
                    '<form action="/admin/editEventType"  method="post">'+
                        '<input name="id" type="text" class="d-none" value="'+list.id+'" readonly/>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputname">Name</label>'+
                    '<input type="text" name="name" class="form-control" id="exampleInputname" value="'+list.name+'" placeholder="Enter name"/>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputDescription">Description</label>'+
                    '<textarea class="form-control" name="description"  id="exampleInputDescription"  rows="3">'+list.description+'</textarea>'+
                    '</div>'+
                    '<div class="form-group">'+
                    '<label for="exampleInputPrice">Price in $</label>'+
                    '<input type="number" name="price" class="form-control" id="exampleInputPrice" value="'+list.price+'"  placeholder="Enter price"/>'+

                    '<button type="submit" class="btn btn-primary my-2">Submit</button>'+
                    '</div>'+


                    ' </form>'

                );
                    $(".modal_setting_page").modal("show");
                }
        });
        });


        function sendAjaxForm(result_form, ajax_form, url) {
            $.ajax({
                url: url, //url страницы (action_ajax_form.php)
                type: "POST", //метод отправки
                dataType: "html", //формат данных
                data: $("#" + ajax_form).serialize(),  // Сеарилизуем объект
                success: function () { //Данные отправлены успешно
                    window.location.replace("/admin/settings?success=Данные%20отправлены%20успешно");
                },
                error: function () { // Данные не отправлены
                    window.location.replace("/admin/settings?danger=Ошибка%данные%20не%20отправлены");
                }
            });
        }

        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
            return false;
        };

        var success = getUrlParameter("success");
        var danger = getUrlParameter("danger");

        if (success){
            $(".btn-icon-toast").html("<a href='#' class='btn btn-success btn-circle btn-sm mr-2 '>"+
            "<i class='fas fa-check'></i></a>");
            $(".message").html(success);
            $(".toast-title").html("Success");
            $(".toast").toast('show');
        } else if (danger){
            $(".btn-icon-toast").html("<a href='#' class='btn btn-danger btn-circle btn-sm mr-2'>"+
            "<i class='fas fa-exclamation-triangle'></i></a>");
            $(".message").html(danger);
            $(".toast-title").html("Error!");
            $(".toast").toast('show');
        }


    });
</script>
</body>

</html>