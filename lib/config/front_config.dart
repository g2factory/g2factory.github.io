import 'package:flutter/material.dart';

class FrontConfig {
  static const String companyName = 'g2factory';
  static const MaterialColor mainColor = Colors.teal;
  static const MaterialAccentColor accentColor = Colors.tealAccent;
  static const Color logoMainColor = Color(0xFFF48FB1);
  static const Color logoSubColor = Colors.white;
  static const BoxConstraints pageContentSize =
      BoxConstraints.tightFor(width: 940.0);
  static const double responsiveWidth = 380.0;

  static const String routeRootPage = '/';
  static const String routeMemberPage = '/member';
  static const String routeBlogPage = '/blog';
  static const String routeBlogListPage = '/blog_list';
}
