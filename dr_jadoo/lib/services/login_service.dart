import 'package:dr_jadoo/core/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';

class LoginService {
  static LoginService? _instance;
  String? authToken;

  static LoginService get instance {
    _instance ??= LoginService();
    return _instance!;
  }

  Future<bool> logIn(BuildContext context, String userName, String password) async {
    var body = <String, String>{
      "email": userName, 
      "password": password
    };
    var response = await restClient.post(
      '${EnvConstants.host}/api/token/',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
      body: body
    );
    
    final Map<String, dynamic> data = response;
    if (data.containsKey('access')) {
      authToken = data['access'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', authToken!);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final String? authToken = prefs.getString('token');
    Map<String, dynamic> payload;
    if (authToken != null) {
      payload = JwtDecoder.decode(authToken);
      if (payload['exp'] < DateTime.now().millisecondsSinceEpoch / 1000) {
        return false;
      }
    } else {
      return false;
    }
    return true;
  }
}
