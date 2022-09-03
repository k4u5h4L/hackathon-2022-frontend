import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:dr_jadoo/constants/colours.dart';
import 'package:dr_jadoo/core/popup_service.dart';
import 'package:dr_jadoo/core/rest_client.dart';
import 'package:dr_jadoo/model/User/current_user.dart';
import 'package:dr_jadoo/model/error.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';

class EmployeeDashboardService {
  static EmployeeDashboardService? _instance;

  static EmployeeDashboardService get instance {
    _instance ??= EmployeeDashboardService();
    return _instance!;
  }

  Future<CurrentUser?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? authToken = prefs.getString('token');
    var response = await restClient.get('${EnvConstants.host}/api/user/',
        headers: <String, String>{
          'Accept': '*/*',
          'Authorization': 'Bearer ${authToken!}'
        });
    if (response is Error) {
      return null;
    }
    final CurrentUser currentUser = CurrentUser.fromJson(response);
    return currentUser;
  }
}
