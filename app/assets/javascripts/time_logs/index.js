/**
 * Created by matthew on 2/11/15.
 */

$(document).ready(function(){
    var teamID, subcategoryID, date, hours, minutes;

    $('.datepicker').datepicker();



    //-------showing and hiding modal
    $('#show_modal').on('click', function(event) {
        event.preventDefault();
        $('#modal').fadeIn(800);
        $('#mask').fadeIn(800);
    });

    $('#cancel_time_log').on('click', function(event){
       event.preventDefault();
        $('#modal').fadeOut(800);
        $('#mask').fadeOut(800);
    });



    //---------Ajax Subcategories-----------------
    $('#post_category_id').change(function(){
        if($('#post_category_id').val() != ""){
            $('#subcategories').html("");
            $.ajax({
                url:"/time_logs/ajax_subcategories",
                type: "GET",
                dataType: "HTML",
                data: {category_id: $('#post_category_id').val()},
                success: function(response){
                    $('#subcategories').html(response);
                }
            });
        }
    });

    //----------Submit The Time Log-----------------------
    $('body').on('click','#submit_time_log', function(e){
        getValues();

        e.preventDefault()
       if (canSubmit()) {
           $.ajax({
               url: "/time_logs/create",
               type: "POST",
               dataType: "HTML",
               data: {time_log: {
                   team_id: teamID,
                   subcategory_id: subcategoryID,
                   date: date,
                   hours: hours,
                   minutes: minutes
               }
               },
               success: function (response) {
                   $('#modal').fadeOut(800);
                   $('#mask').fadeOut(800);
                   $('#team_tables').html(response)
               }
           })
       }
        else{
           alert("Please check all fields");
       }
    })

    var getValues = function(){
            teamID = $('#time_log_team_id').val(),
            subcategoryID = $('#time_log_subcategory_id').val(),
            date = $('#time_log_date').val(),
            hours = $('#time_log_hours').val(),
            minutes = $('#time_log_minutes').val();
    }

    var canSubmit = function(){
        if (teamID == null ||
            subcategoryID == null ||
            date == null ||
            (hours && minutes == null)){
             return false
        }
        else {
            return true
        }

    }

});
