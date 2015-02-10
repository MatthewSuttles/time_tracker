/**
 * Created by matthew on 2/2/15.
 */
$(document).ready(function(){
    var $team_users = $("#team_user_ids")

    $team_users.change(function(){
       //check to make sure it is not blank
        if ($team_users.val() != ""){
            $.ajax({
                url: "/teams/add_user",
                type: "POST",
                dataType: "HTML",
                data: {user: $team_users.val(),
                team: $('#team_id').data("value")},
                success: function(response){
                    $('#team_users_table tr:last').after(response);
                    $('#table_message').html("User Successfully Added");

                },
                error:function(response){
                    $('#table_message').html("This User Is Already A Part Of This Team")
                }
            })
        }
        else{

        }
     });


//delegate body to be click event for dynamically added rows.
    $('body').on("click", '.delete_user', function(e){
        e.preventDefault();
        var user = $(this).parents("tr").data("id")
        var tr = $(this).parents("tr")
        $.ajax({
            url: "/teams/remove_user",
            type: "GET",
            dataType: "JSON",
            data:{ user: user,
                team: $('#team_id').data("value")
                },
            success: function(response){
                $('#table_message').html("User Successfully Removed");
                tr.remove();

            },
            error:function(response){
                $('#table_message').html("Error Removing User")
            }

        });
    })
});