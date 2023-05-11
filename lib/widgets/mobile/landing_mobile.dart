import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/models/url_launcher.dart';
import 'package:app_portfolio/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LandingMobile extends StatelessWidget {
  final Size size;
  LandingMobile({super.key,required this.size});
  final method = UrlLauncher();
  @override
  Widget build(BuildContext context) {

    return Container(
      height: size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.08,
          ),
          CustomText(
            text: "Hi, my name is",
            textsize: 16.0,
            color: AppConstants.secondaryColor,
            letterSpacing: 3.0,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          AnimatedTextKit(
              repeatForever: false,
              onFinished: () {},
              totalRepeatCount: 1,
              animatedTexts: [
                TypewriterAnimatedText(AppConstants.appTitle,
                    cursor: "|",
                    textStyle: TextStyle(
                      fontSize: 52.0,
                      color: Color.fromARGB(255, 253, 253, 254),
                      letterSpacing: 0.10,
                      fontWeight: FontWeight.w900,
                    ),
                    speed: Duration(milliseconds: 200))
              ]),
          SizedBox(
            height: size.height * 0.04,
          ),
          CustomText(
            text: "I build mobile and desktop applications using Flutter.",
            textsize: 42.0,
            color: Color(0xffCCD6F6).withOpacity(0.6),
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Wrap(
            children: [
              Text(
                "I'm a developer based in Kansas specializing in building (and occasionally designing) exceptional websites, applications, and everything in between.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                  letterSpacing: 2.75,
                  wordSpacing: 0.75,
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            color: AppConstants.secondaryColor,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(0.75),
              height: 56.0,
              width: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Color(0xff0A192F),
              ),
              child: MaterialButton(
                onPressed: () {
                  method.launchEmail();
                },
                hoverColor: Colors.green,
                child: Text(
                  "Get In Touch",
                  style: TextStyle(
                    color: AppConstants.secondaryColor,
                    letterSpacing: 2.75,
                    wordSpacing: 1.0,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
