import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/models/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIconsDesktop extends StatelessWidget {
  SocialIconsDesktop({super.key});
  final method = UrlLauncher();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.09,
      height: size.height - 82,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              method.launchURL(AppConstants.upworkProfileURL);
            },
            child: Image(
              image: AssetImage('${AppConstants.isReleaseMode ? "assets/" : ""}images/upwork-2.png'),
              width: 20,
              height: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          IconButton(
              icon: FaIcon(FontAwesomeIcons.github),
              color: Color(0xffffA8B2D1),
              iconSize: 16.0,
              onPressed: () {
                method.launchURL(AppConstants.gitHubProfileURL);
              }),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.linkedin),
            color: Color(0xffffA8B2D1),
            onPressed: () {
              method.launchURL(AppConstants.linkedInProfileURL);
            },
            iconSize: 16.0,
          ),
          
          IconButton(
              icon: FaIcon(FontAwesomeIcons.envelope),
              color: Color(0xffffA8B2D1),
              iconSize: 16.0,
              onPressed: () {
                method.launchEmail();
              }),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              height: size.height * 0.20,
              width: 2,
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
