import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/widgets/client_row.dart';
import 'package:app_portfolio/widgets/custom_text.dart';

import 'package:app_portfolio/widgets/work_custom_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WorkMobile extends StatelessWidget {
  final Size size;
  const WorkMobile({super.key,required this.size});

  @override
  Widget build(BuildContext context) {
    
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height * 1.4,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: "2.",
                textsize: 20.0,
                color: AppConstants.secondaryColor,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                width: 12.0,
              ),
              CustomText(
                text: "Clients",
                textsize: 26.0,
                color: Color(0xffCCD6F6),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                width: size.width * 0.01,
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
          Row(
            children: [
              Expanded(
                flex: 1,
                child:  Container(
                    height: size.height * 1.2,
                    //color: Colors.indigo,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: const Center(
                                child: VerticalDivider(
                                  color: AppConstants.secondaryColor,
                                  thickness: 1.75,
                                  width: 10,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                            ),
                           const SizedBox(width: 20,),
                           const Spacer(flex: 4,)
                          ],
                        ),
                        Container(
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClientRow(
                                image: "images/guru_app_logo.png",
                                size: size,
                                title: "Golf Home Guru",
                                subTitle:
                                    "Developed a Flutter-based mobile app for the Golf Home Guru, a real estate agent in Southwest Florida, USA. The application allows users to search for homes in the area, view details about the homes, and contact the real estate agent.",
                                duration: "2021",

                              ),
                              ClientRow(
                                size: size, 
                              image: "images/1000HoursOutside_logo.png", 
                               title: "1000 Hours Outside",
                              subTitle:"Developed and maintained the initial version of 1000 Hours Outside, a Flutter-based iOS/ Android app that allows users to track the amount of time they spend outside, earn badges for time spent outside, and save notes and images in a calendar to record days they've spent outside.",
                               duration: "2021-2022",
                              ),
                              ClientRow(
                                size: size,
                                image: "images/bands_around_the_world_logo.png",
                                 title:"Bands Around The World",
                                subTitle:"Developed a Flutter-based iOS/ Android app for Bands Around The World that allows users to track bands, cities, and venues they're interested in to view events, save specific concert events, view maps displaying concert locations, order tickets, and save notes and images for concerts they've attended.",
                                duration: "2021-2023",
                                ),
                              ClientRow(
                                size: size,
                                image: "images/be_bold_logo.png",
                                title: "Marie Diggs Ministries",
                                subTitle:
                                    "Developed a Flutter-based iOS/ Android app for Marie Diggs Ministries that plays video and audio content developed by the ministry, allows users to read bible verses, and track users they've witnessed Christianity to.",
                                duration: "2022-2023",
                                ),
                             ClientRow(size: size, 
                             image: "images/great_direct_logo.png", 
                             imageWidthMultiplier: 2.25,
                             title: "Great Direct Concepts",
          subTitle:
              "Developed a Flutter-based web call-script for Great Direct Concepts LLC.'s call center to handle incoming calls from potential lendees.",
          duration: "2022-2023",)
                             
                             
                            ],
                          )),
                        )
                      ],
                    )),
              ),
            
            ],
          )
        ],
      ),
    );
  }
}