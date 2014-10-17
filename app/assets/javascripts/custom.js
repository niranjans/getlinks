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
};


// Make the javascript load with turbolinks. Works with regular page loads and turbolinks (http://stackoverflow.com/a/17600195/804503)
$(document).ready(ready);
$(document).on('page:load', ready);

