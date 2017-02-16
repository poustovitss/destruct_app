$(document).ready(function () {
  $('#decrypt').on('click', function () {
    console.log('clicked');
    var password = $('#password').val();
    var decrypted = CryptoJS.AES.decrypt(window.encrypted_message, password);
    console.log(password);
    console.log(window.encrypted_message);
    console.log(decrypted.toString());
    $('#decrypted_content').text(decrypted.toString(CryptoJS.enc.Utf8));
  });
});
