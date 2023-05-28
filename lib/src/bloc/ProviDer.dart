import 'package:flutter/material.dart';

class ProviDer extends InheritedWidget {
  static ProviDer _instancia;
  factory ProviDer({MaterialApp child}) {
    if (_instancia == null) {
      _instancia = new ProviDer._internal(child: child);
    }

    return _instancia;
  }

  final loginBloc = LoginBloc();

  ProviDer._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidge) => true;

  static LoginBloc of(BuildContext context, {bool listen}) {
    return context.dependOnInheritedWidgetOfExactType<ProviDer>().loginBloc;
  }
}
