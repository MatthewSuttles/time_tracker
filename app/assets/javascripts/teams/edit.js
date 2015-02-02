/**
 * Created by matthew on 2/2/15.
 */
$(document).ready(function(){
    var $team_users = $("#team_user_ids")
    var $remove_user = $(".delete_user")

    $team_users.change(function(){
       //check to make sure it is not blank
        if ($team_users.val() != ""){
            console.log("true")
            $.ajax({
                url: "/teams/add_user",
                type: "POST",
                dataType: "html",
                data: {user: $team_users.val(),
                team: $('#team_id').data("value")},
                success: function(response){
                    $("#team_users_table").html(response)
                }
            })
        }
        else{

        }
     });



    $remove_user.on("click", function(e){
        e.preventDefault();
        var user = $(this).parents("tr").data("id")
        $.ajax({
            url: "/teams/remove_user",
            type: "GET",
            dataType: "html",
            data:{ user: user,
                team: $('#team_id').data("value")
                },
            success: function(response){
                $("#team_users_table").html(response);
            }

        });
    })
});