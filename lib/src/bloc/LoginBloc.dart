import 'dart:async';

import 'Validators.dart';

class LoginBloc with Validators {
  final _userController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream =>
      _userController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  Function(String) get changeEmail => _userController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  String get email => _userController.value;
  String get password => _passwordController.value;

  dispose() {
    _userController.close();
    _passwordController.close();
  }
}
