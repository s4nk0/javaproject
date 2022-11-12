$( document ).ready(function() {
    var employees_id = [];
    $( ".employees_checkbox" ).on( "click", function() {

        if ($( this ).is(':checked')){
            employees_id.push($( this ).data("id") );
        } else {
            var pos = employees_id.indexOf($( this ).data("id") );
            employees_id.splice(pos, 1);
        }

        console.log( employees_id);
    });

    $( ".accept" ).on( "click", function() {
        var event_id =$(this).data("event_id");
        $.ajax({
            type: "POST",
            data: {employees_id:JSON.stringify(employees_id),
                    event_id:event_id
            },
            url: "/admin/request_info",
            success: function(msg){

                if (window.location.href.toString().split(window.location.host)[1] == "/admin/event_info?id="+event_id){
                    window.location.replace("/admin/event_info?id="+event_id);
                } else {
                    window.location.replace("/admin/requests?success=Request%20is%20accepted");
                }
            }
        });
    });
});