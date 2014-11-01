var ready = function() {

    // TO-DO handle hover events for touch screens - http://www.prowebdesign.ro/how-to-deal-with-hover-on-touch-screen-devices/    -- http://stackoverflow.com/questions/20818863/handling-hover-events-on-a-touch-screen

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

    $('#link_title,#link_url').blur(function() {
       //alert("blur");
       //this.form.link-submit-button.click();
    });

    // Show delete link on hover
    $(document).on('mouseenter',"div[data-link]", function() {
        //  HoverIn
        var idNumber = $(this).data("link");
        $('#delete-link'+idNumber).fadeIn(50);
    }).on('mouseleave',"div[data-link]", function() {
        // HoverOut
        var idNumber = $(this).data("link");
        $('#delete-link'+idNumber).fadeOut(50);
    });

    // Divider checkbox => toggle hr or text boxes
    $(document).on('change',".divider-checkbox", function() {
        // $("#newLinkDivider").toggle(this.checked);
        if(this.checked) {
           $("#newLinkDivider").show();
           $("#link-title-div").hide();
           $("#link-url-div").hide();
        } else {
           $("#newLinkDivider").hide();
           $("#link-title-div").show();
           $("#link-url-div").show();  
        }
          
    });


    // Swap out user info with edit text boxes
    $('#edit_user_info_link').click(function(){ editUserInfo(); return false; });

    function editUserInfo() {
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

    // Sorting links
     $('#user-links').sortable({
        axis: 'y', 
        handle: '.handle',
        update: function(event, ui){
            $.post($(this).data('update-url'), $(this).sortable('serialize'));
        }
    });


};


// Make the javascript load with turbolinks. Works with regular page loads and turbolinks (http://stackoverflow.com/a/17600195/804503)
$(document).ready(ready);
$(document).on('page:load', ready);

