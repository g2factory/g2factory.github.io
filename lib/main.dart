import 'package:flutter/material.dart';
import 'package:g2factory_page/config/front_config.dart';
import 'package:g2factory_page/widget/route_widget.dart';

void main() {
  runApp(G2FactoryHomePage());
}

class G2FactoryHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FrontConfig.companyName,
      theme: ThemeData(
        primarySwatch: FrontConfig.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RouteWidget(),
    );
  }
}

