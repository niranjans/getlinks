var ready = function() {

    $(".error-username").hide();

    $('[data-validate]').blur(function() {
        $this = $(this);
        $.get($this.data('validate'), {
            username: $this.val()
        }).success(function() {
            $(".error-username").hide();
        }).error(function() {
            $(".error-username").show();
        });
    });

    $('#user_name,#user_short_bio').blur(function() {
       //this.form.submit_button.click();
    });

    // Swap out user info with edit text boxes
    $('#edit_user_info_link').click(function(){ editUserInfo(); return false; });

    function editUserInfo() {
        //$('.user_info').empty().append($('.user_info_edit'));
        $('#user_info').hide();  
        $('#user_info_edit').show();  

        $('#user_name').focus();
    };

    function showUserInfo() {
        //$('.user_info').empty().append($('.user_info_edit'));
        $('#user_info').show();  
        $('#user_info_edit').hide();  
    };

    showUserInfo();
};


// Make the javascript load with turbolinks. Works with regular page loads and turbolinks (http://stackoverflow.com/a/17600195/804503)
$(document).ready(ready);
$(document).on('page:load', ready);

