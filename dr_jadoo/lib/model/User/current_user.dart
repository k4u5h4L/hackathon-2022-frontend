import 'dart:convert';

import 'package:dr_jadoo/model/model_utilities.dart';

class CurrentUser {
  const CurrentUser({
    this.username,
    this.email,
    this.about,
    this.groups,
    this.designation,
    this.isStaff,
    this.isActive,
    this.startDate,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    final List<Groups>? groups = json['groups'] is List ? <Groups>[] : null;
    if (groups != null) {
      for (final dynamic item in json['groups']!) {
        if (item != null) {
          groups.add(Groups.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return CurrentUser(
      username: asT<String?>(json['username']),
      email: asT<String?>(json['email']),
      about: asT<String?>(json['about']),
      groups: groups,
      designation: asT<String?>(json['designation']),
      isStaff: asT<bool?>(json['is_staff']),
      isActive: asT<bool?>(json['is_active']),
      startDate: asT<String?>(json['start_date']),
    );
  }

  final String? username;
  final String? email;
  final String? about;
  final List<Groups>? groups;
  final String? designation;
  final bool? isStaff;
  final bool? isActive;
  final String? startDate;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'email': email,
        'about': about,
        'groups': groups,
        'designation': designation,
        'is_staff': isStaff,
        'is_active': isActive,
        'start_date': startDate,
      };
}

class Groups {
  const Groups({
    this.id,
    this.name,
    this.permissions,
  });

  factory Groups.fromJson(Map<String, dynamic> json) {
    final List<int>? permissions = json['permissions'] is List ? <int>[] : null;
    if (permissions != null) {
      for (final dynamic item in json['permissions']!) {
        if (item != null) {
          permissions.add(asT<int>(item)!);
        }
      }
    }
    return Groups(
      id: asT<int?>(json['id']),
      name: asT<String?>(json['name']),
      permissions: permissions,
    );
  }

  final int? id;
  final String? name;
  final List<int>? permissions;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'permissions': permissions,
      };
}
