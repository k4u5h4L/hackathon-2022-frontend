import 'dart:convert';

import 'package:dr_jadoo/model/model_utilities.dart';


class Error {
  Error({
    required this.details,
  });

  factory Error.fromJson(Map<String, dynamic> jsonRes) => Error(
        details: asT<String>(jsonRes['details'])!,
      );

  String details;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'details': details,
      };

  Error clone() =>
      Error.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}