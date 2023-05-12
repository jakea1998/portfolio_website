import 'package:app_portfolio/ui/desktop_home_page.dart';
import 'package:app_portfolio/ui/mobile_home_page.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = Size(constraints.maxWidth, constraints.maxHeight);
        if (constraints.maxWidth >= 1000) {
          return DesktopHomePage(size:size);
        } else {
          return MobileHome(size: size,);
        }
      },
    );
  }
}
