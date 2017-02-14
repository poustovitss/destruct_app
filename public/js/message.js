$(document).ready(function () {

  var string = 'Lorem ipsum dolor sit amet, ...';
  var password = 'my-password';
  var encrypted = CryptoJS.AES.encrypt(string, password);
  console.log(encrypted.toString());
  // will output something like:
  // U2FsdGVkX1/l/LqNSCQixd0iPv4neKAGZvbQDbYUovZE4OcM7l3ULNDgkZQmrweN
  var decrypted = CryptoJS.AES.decrypt(encrypted, password);
  console.log(decrypted.toString(CryptoJS.enc.Utf8));
});
