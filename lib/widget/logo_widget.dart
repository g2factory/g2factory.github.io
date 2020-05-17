import 'package:flutter/widgets.dart';
import 'package:g2factory_page/config/front_config.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'G2',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: FrontConfig.logoMainColor,
            fontFamily: 'Sriracha',
          ),
        ),
        const Text(
          'factory',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: FrontConfig.logoSubColor,
            fontFamily: 'Sriracha',
          ),
        ),
      ],
    );
  }
}
