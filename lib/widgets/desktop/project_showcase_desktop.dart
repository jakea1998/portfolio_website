import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/ui/featured_project.dart';
import 'package:app_portfolio/widgets/app_showcase_model.dart';
import 'package:app_portfolio/widgets/main_title.dart';
import 'package:app_portfolio/widgets/showcase_app_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProjectShowcaseDesktop extends StatelessWidget {
  final Size size;
  const ProjectShowcaseDesktop({super.key,required this.size});

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
                                      
                                         Wrap(
                                            spacing: 16.0,
                                            runSpacing: 16.0,
                                            children: apps.map((e) {
                                              final availableWidth =
                                                  size.width;

                                              final rowItemCount = availableWidth >
                                                      1000
                                                  ? 4
                                                  : availableWidth > 800
                                                      ? 3
                                                      : 1;

                                              final itemWidth =
                                                  (availableWidth -
                                                          ((rowItemCount - 1) *
                                                              16.0)) /
                                                      rowItemCount;

                                              return SizedBox(
                                                width: itemWidth,
                                                child: ShowcaseAppItem(e),
                                              );
                                            }).toList(),
                                          
                                        
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        child: FeatureProject(
                                          imagePath:
                                              "${AppConstants.isReleaseMode ? "assets/" : ""}images/call_script_screenshot.png",
                                          ontab: () {},
                                          projectDesc:
                                              "A logic-based call script for Great Direct Concepts LLC. that allows the call center to process incoming calls, record caller information, save notes, and transmit the call information to Great Direct Concepts' corporate headquarters.",
                                          projectTitle: "GDC Call Script",
                                          tech1: "Dart",
                                          isGithubDisplayed: false,
                                          tech2: "Flutter Web",
                                          tech3: "Flutter_Bloc",
                                        ),
                                      ),
                                    ],
                                  );
  }
}