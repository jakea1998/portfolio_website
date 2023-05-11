import 'package:app_portfolio/widgets/work_custom_data.dart';
import 'package:flutter/material.dart';


class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Golf Home Guru",
          subTitle:
              "Developed a mobile application for the Golf Home Guru, a real estate agent in Southwest Florida, USA. The \napplication is built using Flutter and Dart and is available on both Android and iOS. The application \nallows users to search for homes in the area, view details about the homes, and contact the real estate \nagent.",
          duration: "2021",
        ),
        WorkCustomData(
          title: "1000 Hours Outside",
          subTitle:
              "Developed and maintained the initial version of 1000 Hours Outside, a Flutter-based iOS/ Android app that allows users to track the amount of time they spend outside, earn badges for time spent outside, and save notes and images in a calendar to record days they've spent outside.",
          duration: "2021-2022",
        ),
        WorkCustomData(
          title:
              "Bands Around The World",
          subTitle:
              "Developed a Flutter-based iOS/ Android app for Bands Around The World that allows users to track bands, cities, and venues they're interested in to view events, save specific concert events, view maps displaying concert locations, order tickets, and save notes and images for concerts they've attended.",
          duration: "2021-2023",
        ),
        WorkCustomData(
          title: "Marie Diggs Ministries",
          subTitle:
              "Developed a Flutter-based iOS/ Android app for Marie Diggs Ministries that plays video and audio content developed by the ministry, allows users to read bible verses, and track users they've witnessed Christianity to.",
          duration: "2022-2023",
        ),
        WorkCustomData(
          title: "Great Direct Concepts",
          subTitle:
              "Developed a Flutter-based web call-script for Great Direct Concepts LLC.'s call center to handle incoming calls from potential lendees.",
          duration: "2022-2023",
        ),
      ],
    );
  }
}
