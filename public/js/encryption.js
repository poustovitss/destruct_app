$(document).ready(function () {
  $('#has_password').change(function () {
    $('#user_password_form')[$(this).prop('checked') ? 'show' : 'hide']();
  });

  $('#message_form').submit(function () {

    var message = $('#message_content').val();

    if ($('#has_password').prop('checked')) {
      var password = $('#password').val();
      message = CryptoJS.AES.encrypt(message, password);
      console.log(message);
    }

    $('#encrypted_message').val(message);
  });
});
