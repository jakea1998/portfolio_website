import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DesktopFooter extends StatelessWidget {
  final Size size;
  const DesktopFooter({super.key,required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
                                      alignment: Alignment.center,
                                      height:
                                          size.height /
                                              6,
                                      width:size.width -
                                          100,
                                      //color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Powered by Flutter",
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(0.4),
                                              letterSpacing: 1.75,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          FlutterLogo(size: 30,)
                                        ],
                                      ),
                                    );
  }
}