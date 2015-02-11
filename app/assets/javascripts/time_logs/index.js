/**
 * Created by matthew on 2/11/15.
 */

$(document).ready(function(){
    $('#show_modal').on('click', function(event) {
        event.preventDefault();
        $('#modal').fadeIn(800);
    });

    $('.datepicker').datepicker();

});
