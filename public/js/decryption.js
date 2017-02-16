$(document).ready(function () {
  $('#decrypt').on('click', function () {
    var password = $('#password').val();
    var decrypted = CryptoJS.AES.decrypt(window.encrypted_message, password);
    $('#decrypted_content').text(decrypted.toString(CryptoJS.enc.Utf8));
  });
});
