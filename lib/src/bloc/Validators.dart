import 'dart:async';

class Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.length >= 2) {
      sink.add(email);
    } else {
      sink.addError('Debe tener minimo 2 caracteres');
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 4) {
      sink.add(password);
    } else {
      sink.addError('Debe tener minimo 4 caracteres');
    }
  });
}
