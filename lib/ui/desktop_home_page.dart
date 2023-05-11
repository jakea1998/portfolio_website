import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/models/url_launcher.dart';
import 'package:app_portfolio/ui/about.dart';
import 'package:app_portfolio/ui/contact.dart';
import 'package:app_portfolio/ui/featured_project.dart';
import 'package:app_portfolio/ui/footer.dart';
import 'package:app_portfolio/ui/work.dart';
import 'package:app_portfolio/widgets/app_bar_title.dart';
import 'package:app_portfolio/widgets/app_showcase_model.dart';
import 'package:app_portfolio/widgets/custom_text.dart';
import 'package:app_portfolio/widgets/landing_desktop.dart';
import 'package:app_portfolio/widgets/main_title.dart';
import 'package:app_portfolio/widgets/os_images.dart';
import 'package:app_portfolio/widgets/showcase_app_item.dart';
import 'package:app_portfolio/widgets/social_icons_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UrlLauncher method = UrlLauncher();
  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;
  
  bool isExpanded = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpanded != false
                ? setState(
                    () {
                      isExpanded = false;
                      
                    },
                  )
                : {}
            : isExpanded != true
                ? setState(() {
                    
                    isExpanded = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({required int index,required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppConstants.primaryColor,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
         
          child: Column(
            children: [
              //Navigation Bar
              Container(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                                      fit: BoxFit.fitHeight,
                                      height: size.height * 0.06,
                                      width: size.width * 0.06,
                                      image: const AssetImage("images/website_logo_3.png"),
                                    ),
                        
                      ),
                     
                     
                      const Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: [
                                Tab(
                                  child: AppBarTitle(
                                    text: 'About',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Clients',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Projects',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Contact Me',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Card(
                          elevation: 4.0,
                          color: AppConstants.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(0.85),
                            height: size.height * 0.07,
                            width: size.height * 0.20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xff0A192F),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                //method.launchURL(
                                  //  "https://drive.google.com/file/d/1yHLcrN5pCUGIeT8SrwC2L95Lv0MVbJpx/view?usp=sharing");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  "Resume",
                                  style: TextStyle(
                                    color: AppConstants.secondaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  //Social Icon
                  SocialIconsDesktop(),
                  Expanded(
                    child: Container(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                                delegate: SliverChildListDelegate([
                              
                              LandingDesktop(size: size),
                              //About Me
                              _wrapScrollTag(
                                index: 0,
                                child: About(),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(index: 1, child: Work()),
                              SizedBox(
                                height: size.height * 0.10,
                              ),

                              //Some Things I've Built Main Project
                              _wrapScrollTag(
                                  index: 2,
                                  child: Column(
                                    children: [
                                      MainTiitle(
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
                                              final availableWidth = constraints.maxWidth;

                                              final rowItemCount = constraints.maxWidth > 1000 ? 4 : constraints.maxWidth > 800 ? 3 : 1
                                              
                                                      ;

                                              final itemWidth = (availableWidth - ((rowItemCount - 1) * 16.0)) / rowItemCount;

                                              return SizedBox(
                                                width: itemWidth,
                                                child: ShowcaseAppItem(e),
                                              );
                                            }).toList(),
                                          );
                                        },
                                      ), 
                                      SizedBox(height: 30,),
                                            Container(
                                              child: FeatureProject(
                                          imagePath: "images/call_script_screenshot.png",
                                          ontab: () {
                                            
                                          },
                                          projectDesc:
                                              "A call script for Great Direct Concepts LLC. that allows the call center to process incoming calls, record caller information, save notes, and transmit the call information to Great Direct Concepts' corporate headquarters.",
                                          projectTitle: "GDC Call Script",
                                          tech1: "Dart",
                                          isGithubDisplayed: false,
                                          tech2: "Flutter Web",
                                          tech3: "Flutter_Bloc",
                                        ),
                 ),
                                    ],
                                  )),

                             

                              //Get In Touch
                              _wrapScrollTag(
                                index: 3,
                                child: Column(
                                  children: [
                                    
                                   ContactMe(),
                                    //Footer
                                    Footer()
                                  ],
                                ),
                              ),
                            ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RotatedBox(
                          quarterTurns: 45,
                          child: Text(
                            "jake_stegeman@yahoo.com",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: 100,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
