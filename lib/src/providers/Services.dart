import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Services {
  static Services _instance = new Services.internal();
  static final Services serv = Services._();
  Services._();
  Services.internal();
  factory Services() => _instance;
  // ignore: unused_field
  final _prefs = new PreferenciasUsuario();

  var url = Strings.baseURL;

  Future<LoginAcceso> fetchLogin(String email, String password) async {
    ApiBaseHelper _helper = ApiBaseHelper();
    final uri = '$url/token/';
    Map body = {'username': email, 'password': password};
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final response =
        await _helper.postWithHeader(uri, jsonEncode(body), headers);
    print(response);
    return LoginAcceso.fromJson(response);
  }
}
