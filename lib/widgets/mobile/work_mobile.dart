import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/widgets/custom_text.dart';
import 'package:app_portfolio/widgets/work_box.dart';
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
                child: Container(
                    height: size.height * 1.2,
                    //color: Colors.indigo,
                    child: Stack(
                      children: [
                        Center(
                          child: VerticalDivider(
                            color: AppConstants.secondaryColor,
                            thickness: 1.75,
                            width: 10,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                        Container(
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: size.height * 0.07,
                                  width: size.height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                        image: AssetImage(
                                            "images/guru_app_logo.png"),
                                        fit: BoxFit.fitWidth),
                                  )),
                              Container(
                                  height: size.height * 0.07,
                                  width: size.height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                        image: AssetImage(
                                            "images/1000HoursOutside_logo.png"),
                                        fit: BoxFit.fitWidth),
                                  )),
                              Container(
                                  height: size.height * 0.07,
                                  width: size.height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                        image: AssetImage(
                                            "images/bands_around_the_world_logo.png"),
                                        fit: BoxFit.fitWidth),
                                  )),
                              Container(
                                  height: size.height * 0.07,
                                  width: size.height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                        image: AssetImage(
                                            "images/be_bold_logo.png"),
                                        fit: BoxFit.fitWidth),
                                  )),
                              Container(
                                  height: size.height * 0.07,
                                  width: (size.height * 0.07) * 2.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                        image: AssetImage(
                                            "images/great_direct_logo.png"),
                                        fit: BoxFit.fitWidth),
                                  )),
                            ],
                          )),
                        )
                      ],
                    )),
              ),
              SizedBox(width: 20,),
              Expanded(
                  flex: 4,
                  child: Container(
                    height: size.height * 1.2,
                    child: WorkBox(),
                  )),
                SizedBox(width: 10,)
            ],
          )
        ],
      ),
    );
  }
}