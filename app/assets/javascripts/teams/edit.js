/**
 * Created by matthew on 2/2/15.
 */
$(document).ready(function(){
    var $team_users = $("#team_user_ids")
    var $remove_user = $(".delete_user")
    var $td = $('<td>')
    var $tr = $('<tr>')

    $team_users.change(function(){
       //check to make sure it is not blank
        if ($team_users.val() != ""){
            console.log("true")
            $.ajax({
                url: "/teams/add_user",
                type: "POST",
                dataType: "JSON",
                data: {user: $team_users.val(),
                team: $('#team_id').data("value")},
                success: function(response){
                    json_response = $.parseJSON()
                    console.log(json_response)
                    $team_users.append(
                        $tr.append(
                            $td.text(response.first_name),
                            $td.text(response.last_name),
                            $td.text(response.email),
                            $td.text(response.admin),
                            $td.append("<a href='/users/edit.1'>edit</a> '/' <a class='delete_user' href=''>delete</a>")
                        )

                    );
                }
            })
        }
        else{

        }
     });



    $remove_user.on("click", function(e){
        e.preventDefault();
        var user = $(this).parents("tr").data("id")
        var tr = $(this).parents('tr')
        $.ajax({
            url: "/teams/remove_user",
            type: "GET",
            dataType: "JSON",
            data:{ user: user,
                team: $('#team_id').data("value")
                },
            success: function(response){
                tr.remove();
            }

        });
    })
});