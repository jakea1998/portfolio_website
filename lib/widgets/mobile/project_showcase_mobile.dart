import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/ui/featured_project.dart';
import 'package:app_portfolio/widgets/app_showcase_model.dart';
import 'package:app_portfolio/widgets/custom_text.dart';
import 'package:app_portfolio/widgets/main_title.dart';
import 'package:app_portfolio/widgets/showcase_app_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProjectShowcaseMobile extends StatelessWidget {
  final Size size;
  const ProjectShowcaseMobile({super.key,required this.size});
  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: AppConstants.secondaryColor.withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xff717C99),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {

    return Column(
                                    children: [
                                      MainTitle(
                                        number: "3.",
                                        text: "Project Showcase",
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      LayoutBuilder(
                                        builder: (context, constraints) {
                                          return Wrap(
                                            spacing: 16.0,
                                            runSpacing: 16.0,
                                            children: apps.map((e) {
                                              final availableWidth =
                                                  constraints.maxWidth-40;

                                              final rowItemCount = constraints.maxWidth > 800
                                                      ? 3
                                                      : 1;

                                              final itemWidth =
                                                  (availableWidth -
                                                          ((rowItemCount - 1) *
                                                              16.0)) /
                                                      rowItemCount;

                                              return SizedBox(
                                                width: itemWidth,
                                                child: ShowcaseAppItem(e,displayOverlay: false,),
                                              );
                                            }).toList(),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Column(children: [
                                        Wrap(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      alignment: WrapAlignment.end,
                      children: [
                        CustomText(
                          text: "GDC Call Script" ,
                          textsize: 27,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.75,
                        ),
                        
                      ],
                    ),
                    SizedBox(height:15),
                   Container(
                    
                    
                    color: Colors.redAccent,
                    child: const Image(
                      fit: BoxFit.contain,
                      image: AssetImage('images/call_script_screenshot.png' ?? ""),
                    ),
                  ),
                  SizedBox(height:15),
                        Container(
                    alignment: Alignment.center,
                   
                    color: Color(0xff172A45),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
                          child: CustomText(
                            text: "A call script for Great Direct Concepts LLC. that allows the call center to process incoming calls, record caller information, save notes, and transmit the call information to Great Direct Concepts' corporate headquarters.",
                            textsize: 16.0,
                            color: Colors.white.withOpacity(0.4),
                            letterSpacing: 0.75,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:15),
                   Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                technology(context, "Dart"),
                            technology(context, "Flutter Web"),
                            technology(context, "Flutter_Bloc"),
                            
                              ],
                            ),),
                                      ],),
                                      /* Container(
                                        child: FeatureProject(
                                          imagePath:
                                              "images/call_script_screenshot.png",
                                          ontab: () {},
                                          projectDesc:
                                              "A call script for Great Direct Concepts LLC. that allows the call center to process incoming calls, record caller information, save notes, and transmit the call information to Great Direct Concepts' corporate headquarters.",
                                          projectTitle: "GDC Call Script",
                                          tech1: "Dart",
                                          isGithubDisplayed: false,
                                          tech2: "Flutter Web",
                                          tech3: "Flutter_Bloc",
                                        ),
                                      ), */
                                    ],
                                  );
  }
}