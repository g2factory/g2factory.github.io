import 'package:flutter/material.dart';
import 'package:g2factory_page/page/blog_list_page.dart';
import 'package:g2factory_page/page/member_page.dart';

class FrontConfig {
  static const String companyName = 'g2factory';
  static const MaterialColor mainColor = Colors.teal;
  static const MaterialAccentColor accentColor = Colors.tealAccent;
  static const Color logoMainColor = Color(0xFFF48FB1);
  static const Color logoSubColor = Colors.white;
  static const BoxConstraints pageContentSize =
      BoxConstraints.tightFor(width: 640.0);

  static const String routeRootPage = '/';
  static const String routeMemberPage = '/member';
  static const String routeBlogPage = '/blog';
  static const String routeBlogListPage = '/blog_list';
}
