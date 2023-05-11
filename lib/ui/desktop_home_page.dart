import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/models/url_launcher.dart';
import 'package:app_portfolio/widgets/desktop/about_desktop.dart';
import 'package:app_portfolio/widgets/desktop/contact_me_desktop.dart';
import 'package:app_portfolio/ui/featured_project.dart';
import 'package:app_portfolio/widgets/desktop/project_showcase_desktop.dart';

import 'package:app_portfolio/widgets/desktop/work_desktop.dart';
import 'package:app_portfolio/widgets/app_bar_title.dart';
import 'package:app_portfolio/widgets/app_showcase_model.dart';
import 'package:app_portfolio/widgets/custom_text.dart';
import 'package:app_portfolio/widgets/desktop/desktop_footer.dart';
import 'package:app_portfolio/widgets/desktop/social_icons_desktop.dart';
import 'package:app_portfolio/widgets/desktop/landing_desktop.dart';
import 'package:app_portfolio/widgets/main_title.dart';

import 'package:app_portfolio/widgets/showcase_app_item.dart';

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

  Widget _wrapScrollTag({required int index, required Widget child}) {
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
          physics: const ScrollPhysics(),
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
                      GestureDetector(
                        onTap:(){_scrollToIndex(0);},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            fit: BoxFit.fitHeight,
                            height: 50,
                            width: 50,
                            image: const AssetImage("images/website_logo_3.png"),
                          ),
                        ),
                      ),
                      
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index+1);
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
                      /* Padding(
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
                                  "Resumé",
                                  style: TextStyle(
                                    color: AppConstants.secondaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ), */
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
                              _wrapScrollTag(index: 0, child: 
                              LandingDesktop(size: size),),
                              //About Me
                              _wrapScrollTag(
                                index: 1,
                                child: AboutDesktop(),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(index: 2, child: WorkDesktop()),
                              SizedBox(
                                height: size.height * 0.10,
                              ),

                              //Project Showcase
                              _wrapScrollTag(
                                  index: 3,
                                  child: ProjectShowcaseDesktop(size: size)),

                              //Contact Me
                              _wrapScrollTag(
                                index: 4,
                                child: Column(
                                  children: [
                                    ContactMeDesktop(),
                                    //Footer
                                    const DesktopFooter()
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
