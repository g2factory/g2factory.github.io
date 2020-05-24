import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:g2factory_page/config/front_config.dart';
import 'package:g2factory_page/widget/base_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDetailWidget extends StatelessWidget {
  final MapEntry member;
  MemberDetailWidget({Key key, this.member}) : super(key: key);
  Map<int, TableColumnWidth> _columnWidths;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: FrontConfig.pageContentSize,
      child: Card(
        color: FrontConfig.mainColor.shade50,
        margin: EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0, bottom: 0.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (BaseWidget.largeWindow)
                Row(children: profileWidget())
              else
                Column(
                    mainAxisSize: MainAxisSize.min, children: profileWidget()),
              FlatButton(
                  onPressed: () async {
                    // ホームページからのお問い合わせ
                    const String subject =
                        '%E3%83%9B%E3%83%BC%E3%83%A0%E3%83%9A%E3%83%BC%E3%82%B8%E3%81%8B%E3%82%89%E3%81%AE%E3%81%8A%E5%95%8F%E3%81%84%E5%90%88%E3%82%8F%E3%81%9B';
                    // お名前:\n要件:\nご連絡方法:
                    const String body =
                        '%E3%81%8A%E5%90%8D%E5%89%8D%3A%5Cn%E8%A6%81%E4%BB%B6%3A%5Cn%E3%81%94%E9%80%A3%E7%B5%A1%E6%96%B9%E6%B3%95%3A';
                    String uri =
                        'mailto:${member.value['mail']}?subject=$subject&body=$body';
                    await launch(uri);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'メールを送る',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: FrontConfig.mainColor.shade50,
                        ),
                      ),
                      Icon(
                        Icons.mail_outline,
                        color: FrontConfig.mainColor.shade50,
                      ),
                    ],
                  ),
                  color: FrontConfig.mainColor.shade300),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> profileWidget() {
    if (BaseWidget.largeWindow) {
      _columnWidths = {
        0: FractionColumnWidth(0.2),
        1: FractionColumnWidth(0.8),
      };
    } else {
      _columnWidths = {
        0: FractionColumnWidth(0.3),
        1: FractionColumnWidth(0.7),
      };
    }
    EdgeInsets padding = const EdgeInsets.only(left: 8.0);
    return [
      Container(
          constraints: BoxConstraints.loose(Size(120.0, 120.0)),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(member.value['icon']),
              ))),
      Flexible(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Table(
              border:
                  TableBorder(verticalInside: BorderSide(color: Colors.white)),
              defaultVerticalAlignment: TableCellVerticalAlignment.top,
              columnWidths: _columnWidths,
              children: [
                TableRow(children: [
                  Text('なまえ'),
                  Padding(
                    padding: padding,
                    child: Text(member.value['name']),
                  ),
                ]),
                TableRow(children: [
                  Text('できること'),
                  Padding(
                    padding: padding,
                    child: Text(member.value['skill']),
                  ),
                ]),
                if (member.value['achieve'] != null)
                  TableRow(children: [
                    Text('じっせき'),
                    Padding(
                      padding: padding,
                      child: Text(member.value['achieve']),
                    ),
                  ]),
                TableRow(children: [
                  Text('といあわせ'),
                  Padding(
                    padding: padding,
                    child: Text(member.value['mail']),
                  ),
                ]),
              ]),
        ),
      ),
    ];
  }
}
