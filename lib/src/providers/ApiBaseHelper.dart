import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  Future<dynamic> get(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> getWithHeader(String url, Map<String, String> headers) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      responseJson = _returnResponse(response);
      print(responseJson);
    } on SocketException {
      print('No net');
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    print('Api Post, url $url body $body');
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> postWithHeader(
      String url, dynamic body, Map<String, String> headers) async {
    print('Api Post, url $url body $body');
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 201:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      var responseJson = json.decode(response.body.toString());
      var resp = responseJson['error'] != null
          ? responseJson['error']['message']
          : response.body.toString();
      throw BadRequestException(resp);
    case 401:
      var responseJson = json.decode(response.body.toString());
      var resp = responseJson['error'] != null
          ? responseJson['error']['message']
          : response.body.toString();
      throw UnauthorisedException(resp);
    case 403:
      var responseJson = json.decode(response.body.toString());
      var resp = responseJson['error'] != null
          ? responseJson['error']['message']
          : response.body.toString();
      throw UnauthorisedException(resp);
    case 404:
      var responseJson = json.decode(response.body.toString());
      var resp = responseJson['error'] != null
          ? responseJson['error']['message']
          : response.body.toString();
      throw NotFoundException(resp);
    case 500:
      var responseJson = json.decode(response.body.toString());
      var resp = responseJson['error'] != null
          ? responseJson['error']['message']
          : response.body.toString();
      throw InternalServerException(resp);
    default:
      throw FetchDataException(
          'Se produjo un error al comunicarse con el servidor con StatusCode : ${response.statusCode}');
  }
}
