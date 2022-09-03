import 'dart:async';
import 'dart:convert';

import 'package:dr_jadoo/core/popup_service.dart';
import 'package:dr_jadoo/model/error.dart';
import 'package:http/http.dart' as http;

final RestClient restClient = RestClient();

class RestClient {
  final int _timeout = 3;
  final String _timeoutMessage = '{"message" : "Timeout occured"}';

  // instantiate json decoder for json serialization
  final JsonDecoder _decoder = const JsonDecoder();

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(String path, {Map<String, String>? headers}) {
    print('GET: $path');
    print('HEADERS: $headers');
    return http
        .get(
      Uri.parse(path),
      headers: headers,
    )
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      final FutureOr<http.Response> error =
          Future.value(http.Response(_timeoutMessage, 408));
      return error;
    }).then(_createResponse);
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(String path,
      {Map<String, String>? headers, body, encoding}) {
    print('POST: $path');
    print('BODY: $body');
    print('HEADERS: $headers');
    return http
        .post(
      Uri.parse(path),
      body: jsonEncode(body),
      headers: headers,
      encoding: encoding,
    )
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      final FutureOr<http.Response> error =
          Future.value(http.Response(_timeoutMessage, 408));
      return error;
    }).then(_createResponse);
  }

  // Put:----------------------------------------------------------------------
  Future<dynamic> put(String path,
      {Map<String, String>? headers, body, encoding}) {
    print('PUT: $path');
    print('BODY: $body');
    print('HEADERS: $headers');
    return http
        .put(
      Uri.parse(path),
      body: jsonEncode(body),
      headers: headers,
      encoding: encoding,
    )
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      final FutureOr<http.Response> error =
          Future.value(http.Response(_timeoutMessage, 408));
      return error;
    }).then(_createResponse);
  }

  // Delete:----------------------------------------------------------------------
  Future<dynamic> delete(String path,
      {Map<String, String>? headers, body, encoding}) {
    print('DELETE: $path');
    print('BODY: $body');
    print('HEADERS: $headers');
    return http
        .delete(
      Uri.parse(path),
      body: jsonEncode(body),
      headers: headers,
      encoding: encoding,
    )
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      final FutureOr<http.Response> error =
          Future.value(http.Response(_timeoutMessage, 408));
      return error;
    }).then(_createResponse);
  }

  // Response:------------------------------------------------------------------
  dynamic _createResponse(http.Response response) {
    final String res = response.body;
    final int statusCode = response.statusCode;
    print('RESPONSE: $res');
    if (statusCode < 200 || statusCode > 400) {
      final Error error = Error.fromJson(_decoder.convert(res));
      return error;
    }
    return _decoder.convert(res);
  }
}
