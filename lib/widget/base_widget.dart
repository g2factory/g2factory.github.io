import 'package:flutter/material.dart';
import 'package:g2factory_page/config/front_config.dart';
import 'package:g2factory_page/widget/logo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseWidget extends StatelessWidget {
  final Widget body;

  BaseWidget({Key key, this.body})
      : assert(body != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontConfig.mainColor.shade300,
      appBar: AppBar(
        title: LogoWidget(),
        actions: <Widget>[
          FlatButton(
              child: Text(
                'めんばー',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: FrontConfig.mainColor.shade50,
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pushNamed(FrontConfig.routeMemberPage);
              }),
          FlatButton(
              child: Text(
                'ぶろぐ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: FrontConfig.mainColor.shade50,
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pushNamed(FrontConfig.routeBlogListPage);
              }),
          FlatButton(
              child: Text(
                'ぎっとはぶ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: FrontConfig.mainColor.shade50,
                ),
              ),
              onPressed: () async {
                await launch(
                    'https://github.com/g2factory/g2factory.github.io');
              }),
        ],
      ),
      body: body,
    );
  }
}
