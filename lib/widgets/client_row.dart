import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/widgets/work_custom_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ClientRow extends StatelessWidget {
  final Size size;
  final String image;
  final String title;
  final String subTitle;
  final String duration;
  final double imageWidthMultiplier;
  const ClientRow({super.key, required this.size,required this.image,required this.title,required this.subTitle,required this.duration,this.imageWidthMultiplier=1});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Container(
                height: size.height * 0.07,
                width: size.height * 0.07*imageWidthMultiplier,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                      image: AssetImage(
                          "${AppConstants.isReleaseMode ? "assets/" : ""}$image"),
                      fit: BoxFit.fitWidth),
                )),
          ),
        ),
       const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 4,
          child: WorkCustomData(
            title: title,
            subTitle:
               subTitle,
            duration: duration,
          ),
        )
      ],
    );
  }
}
