import 'package:flutter/material.dart';

class MenuOption {
  final String route;
  final String name;
  final Widget page;

  MenuOption(
      {required this.route,
      required this.name,
      required this.page});
}
