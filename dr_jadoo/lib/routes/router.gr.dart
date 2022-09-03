// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../screens/employee_dashboard/employee_dashboard_screen.dart' as _i2;
import '../screens/login/login_screen.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    EmployeeDashboardRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeDashboardRouteArgs>(
          orElse: () => const EmployeeDashboardRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.EmployeeDashboardScreen(
              key: args.key, selectedIndex: args.selectedIndex));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(LoginRoute.name, path: '/'),
        _i3.RouteConfig(EmployeeDashboardRoute.name,
            path: '/employee-dashboard-screen')
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i3.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.EmployeeDashboardScreen]
class EmployeeDashboardRoute
    extends _i3.PageRouteInfo<EmployeeDashboardRouteArgs> {
  EmployeeDashboardRoute({_i4.Key? key, int selectedIndex = 0})
      : super(EmployeeDashboardRoute.name,
            path: '/employee-dashboard-screen',
            args: EmployeeDashboardRouteArgs(
                key: key, selectedIndex: selectedIndex));

  static const String name = 'EmployeeDashboardRoute';
}

class EmployeeDashboardRouteArgs {
  const EmployeeDashboardRouteArgs({this.key, this.selectedIndex = 0});

  final _i4.Key? key;

  final int selectedIndex;

  @override
  String toString() {
    return 'EmployeeDashboardRouteArgs{key: $key, selectedIndex: $selectedIndex}';
  }
}
