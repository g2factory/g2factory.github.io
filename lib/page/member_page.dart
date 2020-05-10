import 'package:flutter/material.dart';
import 'package:g2factory_page/config/front_config.dart';
import 'package:g2factory_page/widget/member_detail_widget.dart';
import 'package:g2factory_page/config/company_config.dart';
import 'package:g2factory_page/widget/base_widget.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPage createState() => _MemberPage();
}

class _MemberPage extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              constraints: FrontConfig.pageContentSize,
              child: Text(
                'めんばー',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: FrontConfig.mainColor.shade50,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...memberCard()
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> memberCard() {
    return CompanyConfig.members.map((member) {
      return MemberDetailWidget(member: member);
    }).toList();
  }
}