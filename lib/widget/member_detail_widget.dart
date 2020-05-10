import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:g2factory_page/config/front_config.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDetailWidget extends StatelessWidget {
  final MapEntry member;
  MemberDetailWidget({Key key, this.member}) : super(key: key);

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
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(16.0),
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(member.value['icon']),
                      )
                    )
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.top,
                        columnWidths: {
                          0: FractionColumnWidth(0.2),
                          1: FractionColumnWidth(0.8),
                        },
                        children: [
                          TableRow(
                            children: [
                              Text('なまえ'),
                              Text(member.value['name']),
                            ]
                          ),
                          TableRow(
                            children: [
                              Text('できること'),
                              Text(member.value['skill']),
                            ]
                          ),
                          if (member.value['achieve'] != null)
                            TableRow(
                              children: [
                                Text('じっせき'),
                                Text(member.value['achieve']),
                              ]
                            ),
                          TableRow(
                            children: [
                              Text('といあわせ'),
                              Text(member.value['mail']),
                            ]
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
              FlatButton(
                onPressed: () async {
                  // ホームページからのお問い合わせ
                  const String subject = '%E3%83%9B%E3%83%BC%E3%83%A0%E3%83%9A%E3%83%BC%E3%82%B8%E3%81%8B%E3%82%89%E3%81%AE%E3%81%8A%E5%95%8F%E3%81%84%E5%90%88%E3%82%8F%E3%81%9B';
                  // お名前:\n要件:\nご連絡方法:
                  const String body = '%E3%81%8A%E5%90%8D%E5%89%8D%3A%5Cn%E8%A6%81%E4%BB%B6%3A%5Cn%E3%81%94%E9%80%A3%E7%B5%A1%E6%96%B9%E6%B3%95%3A';
                  String uri = 'mailto:${member.value['mail']}?subject=$subject&body=$body';
                  await launch(uri);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'メールを送る',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.mail_outline,
                      color: FrontConfig.mainColor.shade50,
                    ),
                  ],
                ),
                color: FrontConfig.mainColor.shade300
              ),
            ],
          ),
        ),
      ),
    );
  }
}