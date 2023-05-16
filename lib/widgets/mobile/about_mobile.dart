import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutMobile extends StatelessWidget {
  final Size size;
  const AboutMobile({super.key,required this.size});
  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.trophy,
          color: AppConstants.secondaryColor.withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xffCCD6F6).withOpacity(0.7),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FittedBox(
                fit: BoxFit.cover,
                child: Container(
                  width: size.width,
                  //color: Colors.purple,
                  child: Column(
                    children: [
                      //About me title
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "1.",
                            textsize: 20.0,
                            color: Color(0xff61F9D5),
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          CustomText(
                            text: "About Me",
                            textsize: 26.0,
                            color: Color(0xffCCD6F6),
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Container(
                            width: size.width / 4,
                            height: 1.10,
                            color: Color(0xff303C55),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.07,
                      ),

                      //About me desc
                      Wrap(
                        children: [
                          CustomText(
                            text:
                                AppConstants.bio_1,
                            textsize: 16.0,
                            color: Color(0xffCCD6F6).withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.75,
                          ),
                          CustomText(
                            text:
                                AppConstants.bio_2,
                            textsize: 16.0,
                            color: Color(0xffCCD6F6).withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.75,
                          ),
                          CustomText(
                            text:
                               AppConstants.bio_3,
                            textsize: 16.0,
                            color: Color(0xffCCD6F6).withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.75,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.06,
                      ),

                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                technology(context, "Dart"),
                            technology(context, "Flutter"),
                            technology(context, "Firebase"),
                            technology(context, "UI/UX (Figma)"),
                            technology(context, "UI/UX (Adobe XD)"),
                            technology(context, "Android Studio"),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                technology(context, "Python"),
                            technology(context, "Swift"),
                            technology(context, "Jira"),
                            technology(context, "BitBucket"),
                            technology(context, "Git - Github"),
                            technology(context, "Xcode"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.08,
              ),

              //Image
               Center(
                child: Container(
                  height: size.height * 0.7,
                  width: size.width * 0.5,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 50,
                        right: 20,
                        left: 50.0,
                        child: Card(
                          color: Color(0xff61F9D5),
                          child: Container(
                            margin: EdgeInsets.all(2.75),
                            height: size.height * 0.6,
                            width: size.width * 0.35,
                            color: Color(0xff0A192F),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.6,
                        width: size.width * 0.35,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("${AppConstants.isReleaseMode ? "assets/" : ""}images/jake_full_body.png"),
                        ),
                      ),
                      /* Container(
                        height: size.height * 0.5,
                        width: size.width * 0.6,
                        color: AppConstants.secondaryColor.withOpacity(0.5),
                      ), */
                    ],
                  ),
                ),
              ), 
    ],);
  }
}