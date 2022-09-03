import 'package:auto_route/auto_route.dart';
import 'package:dr_jadoo/screens/employee_dashboard/employee_dashboard_screen.dart';
import 'package:dr_jadoo/screens/login/login_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(page: LoginScreen, initial: true),
  AutoRoute(page: EmployeeDashboardScreen)
])
class $AppRouter {}
