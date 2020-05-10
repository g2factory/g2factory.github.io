import 'package:flutter/material.dart';
import 'package:g2factory_page/config/front_config.dart';
import 'package:g2factory_page/page/blog_list_page.dart';
import 'package:g2factory_page/page/blog_page.dart';
import 'package:g2factory_page/page/member_page.dart';

class RouteWidget extends StatefulWidget {
  RouteWidget({Key key}) : super(key: key);
  @override
  _RouteWidget createState() => _RouteWidget();
}

class _RouteWidget extends State<RouteWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FrontConfig.routeRootPage,
      routes: {
        FrontConfig.routeRootPage: (context) => MemberPage(),
        FrontConfig.routeMemberPage: (context) => MemberPage(),
        FrontConfig.routeBlogListPage: (context) => BlogListPage(),
        FrontConfig.routeBlogPage: (context) => BlogPage(),
      },
      theme: ThemeData(primaryColor: FrontConfig.mainColor),
    );
  }
}
