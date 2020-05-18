import 'package:flutter/cupertino.dart';
import 'package:g2factory_page/config/front_config.dart';

class ErrorPages {
  static Widget pageNotFoundPage() {
    return Center(
      child: Text(
        "ページが見つかりません",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: FrontConfig.mainColor.shade50,
        ),
      ),
    );
  }
}
