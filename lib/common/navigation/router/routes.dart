import 'package:fixitpro/features/user/ui/home_page.dart';
import 'package:fixitpro/features/user/ui/register_page.dart';
import 'package:fixitpro/models/models.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoutes = '/home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: '/home',
        name: 'Home',
        page: const HomePage(),
        icon: Icons.house_rounded),
    MenuOption(
        route: '/register',
        name: 'Register',
        page: const RegisterPage(),
        icon: Icons.app_registration_rounded),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.page});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return PageRouteBuilder(pageBuilder: (_, __, ___) => const HomePage());
  }
}
