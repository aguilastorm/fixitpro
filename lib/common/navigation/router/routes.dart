import 'package:fixitpro/features/user/ui/register_confirmation_page.dart';
import 'package:fixitpro/features/user/ui/home_page.dart';
import 'package:fixitpro/features/user/ui/register_addresses_page.dart';
import 'package:fixitpro/features/user/ui/register_birthday_page.dart';
import 'package:fixitpro/features/user/ui/register_name_page.dart';
import 'package:fixitpro/features/user/ui/register_success.dart';
import 'package:fixitpro/models/models.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoutes = '/home';

  static final menuOptions = <MenuOption>[
    MenuOption(
      route: '/home',
      name: 'Inicio',
      page: const HomePage(),
    ),
    MenuOption(
      route: '/register',
      name: 'Registro',
      page: const RegisterPage(),
    ),
    MenuOption(
      route: '/register-confirmation',
      name: 'Register Confirmation',
      page: const RegisterConfirmationPage(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(context) {
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
