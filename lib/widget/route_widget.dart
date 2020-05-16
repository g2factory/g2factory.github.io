import 'package:flutter/material.dart';
import 'package:g2factory_page/config/front_config.dart';
import 'package:g2factory_page/page/blog_list_page.dart';
import 'package:g2factory_page/page/blog_page.dart';
import 'package:g2factory_page/page/error_pages.dart';
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
      },
      theme: ThemeData(primaryColor: FrontConfig.mainColor),
      onGenerateRoute: (settings) {
        List<String> paths = settings.name.split('?');
        String path = paths[0];
        Map<String, String> args = Uri.splitQueryString(paths[1]);
        if (path == FrontConfig.routeBlogPage) {
          return MaterialPageRoute(
            settings: RouteSettings(name: settings.name, arguments: args),
            builder: (context) {
              return BlogPage(args);
            }
          );
        } else {
          return MaterialPageRoute(
            builder: (context) {
              return ErrorPages.pageNotFoundPage();
            }
          );
        }
      },
    );
  }
}
