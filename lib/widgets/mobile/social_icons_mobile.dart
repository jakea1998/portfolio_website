import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/models/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SocialIconsMobile extends StatelessWidget {
   SocialIconsMobile({super.key});
  final method = UrlLauncher();
  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   InkWell(
            onTap: () {
              method.launchURL(AppConstants.upworkProfileURL);
            },
            child: Image(
              image: AssetImage('images/upwork-2.png'),
              width: 20,
              height: 20,
            ),
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
                ],
              );
  }
}