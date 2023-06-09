import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/models/url_launcher.dart';
import 'package:app_portfolio/widgets/desktop/about_desktop.dart';
import 'package:app_portfolio/widgets/desktop/contact_me_desktop.dart';
import 'package:app_portfolio/widgets/featured_project.dart';
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

class DesktopHomePage extends StatefulWidget {
  final Size size;
  DesktopHomePage({super.key,required this.size,});
  @override
  _DesktopHomePageState createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
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
    )..addListener(() {
        _isAppBarExpanded
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
                : {};
      });
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
    
    return Scaffold(
        backgroundColor: AppConstants.primaryColor,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Navigation Bar
              Container(
                height: widget.size.height * 0.14,
                width: widget.size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scrollToIndex(0);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            fit: BoxFit.fitHeight,
                            height: 50,
                            width: 50,
                            image: const AssetImage(
                                "${AppConstants.isReleaseMode ? "assets/" : ""}images/website_logo_3.png"),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                              indicatorColor: Colors.white,
                              indicatorPadding: EdgeInsets.all(8),
                              onTap: (index) async {
                                _scrollToIndex(index + 1);
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
                     
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  //Social Icon
                  SocialIconsDesktop(size: widget.size,),
                  Expanded(
                    child: Container(
                      height: widget.size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                                delegate: SliverChildListDelegate([
                              _wrapScrollTag(
                                index: 0,
                                child: LandingDesktop(size: widget.size),
                              ),
                              //About Me
                              _wrapScrollTag(
                                index: 1,
                                child: AboutDesktop(size: widget.size,),
                              ),
                              SizedBox(
                                height: widget.size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(index: 2, child: WorkDesktop(size:widget.size)),
                              SizedBox(
                                height: widget.size.height * 0.10,
                              ),

                              //Project Showcase
                              _wrapScrollTag(
                                  index: 3,
                                  child: ProjectShowcaseDesktop(size: widget.size)),

                              //Contact Me
                              _wrapScrollTag(
                                index: 4,
                                child: Column(
                                  children: [
                                    ContactMeDesktop(size: widget.size,),
                                    //Footer
                                    DesktopFooter(size: widget.size,)
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
                    width: widget.size.width * 0.07,
                    height:widget.size.height - 82,
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
