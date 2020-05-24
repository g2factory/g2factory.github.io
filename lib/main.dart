import 'package:flutter/material.dart';
import 'package:g2factory_page/config/front_config.dart';
import 'package:g2factory_page/page/blog_list_page.dart';
import 'package:g2factory_page/page/blog_page.dart';
import 'package:g2factory_page/widget/base_widget.dart';
import 'package:g2factory_page/widget/error_widgets.dart';
import 'package:g2factory_page/page/member_page.dart';

void main() {
  runApp(G2FactoryHomePage());
}

class G2FactoryHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: FrontConfig.companyName,
      theme: ThemeData(
        primarySwatch: FrontConfig.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        FrontConfig.routeRootPage: (context) => MemberPage(),
        FrontConfig.routeMemberPage: (context) => MemberPage(),
        FrontConfig.routeBlogListPage: (context) => BlogListPage(),
      },
      onGenerateRoute: (settings) {
        List<String> paths = settings.name.split('?');
        String path = paths[0];
        Map<String, String> args = Uri.splitQueryString(paths[1]);
        switch (path) {
          case FrontConfig.routeBlogPage:
            {
              return MaterialPageRoute(
                  settings: RouteSettings(name: settings.name, arguments: args),
                  builder: (context) {
                    return BlogPage(args);
                  });
            }
          default:
            {
              return MaterialPageRoute(builder: (context) {
                return BaseWidget(body: ErrorPages.pageNotFoundPage());
              });
            }
        }
      },
    );
  }
}
