import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/models/url_launcher.dart';
import 'package:app_portfolio/widgets/custom_text.dart';
import 'package:app_portfolio/widgets/mobile/about_mobile.dart';
import 'package:app_portfolio/widgets/mobile/contact_me_mobile.dart';
import 'package:app_portfolio/widgets/mobile/landing_mobile.dart';
import 'package:app_portfolio/widgets/mobile/mobile_footer.dart';
import 'package:app_portfolio/widgets/mobile/project_showcase_mobile.dart';
import 'package:app_portfolio/widgets/mobile/social_icons_mobile.dart';
import 'package:app_portfolio/widgets/mobile/work_mobile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MobileHome extends StatefulWidget {
  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      backgroundColor: AppConstants.primaryColor,
     
      endDrawer: Drawer(
          elevation: 6.0,
          backgroundColor: AppConstants.primaryColor.withOpacity(0.7),
          child: Column(
            children: [
              Row(children: [
                Spacer(),
                Padding(padding: EdgeInsets.all(8),child:IconButton(icon: FaIcon(FontAwesomeIcons.close,color: Colors.white,), onPressed: (){
                  _scaffoldKey.currentState!.closeEndDrawer();
                }),)
              ],),
               ListTile(
                onTap: (){
                  _scaffoldKey.currentState!.closeEndDrawer();
                  _scrollToIndex(0);
                  
                },
                iconColor:  Colors.white,
                textColor:  Colors.white,
                leading: const FaIcon(FontAwesomeIcons.house,size: 20,),
                title:const Text("Home"),
              ),
              
              ListTile(
              onTap: (){
                  _scaffoldKey.currentState!.closeEndDrawer();
                  _scrollToIndex(1);
                  
                },
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: FaIcon(FontAwesomeIcons.person,size: 20,),
                title: Text("About Me"),
              ),
              ListTile(
                onTap: (){
                  _scaffoldKey.currentState!.closeEndDrawer();
                  _scrollToIndex(2);
                  
                },
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: FaIcon(FontAwesomeIcons.peopleGroup,size: 20,),
                title: Text("Clients"),
              ),
              
              ListTile(
                onTap: (){
                  _scaffoldKey.currentState!.closeEndDrawer();
                  _scrollToIndex(3);
                  
                },
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: FaIcon(FontAwesomeIcons.code,size: 20,),
                title: Text("Project Showcase"),
              ),
              ListTile(
                onTap: (){
                  _scaffoldKey.currentState!.closeEndDrawer();
                  _scrollToIndex(4);
                  
                },
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: FaIcon(FontAwesomeIcons.envelope,size: 20,),
                title: Text("Contact Me"),
              ),
              Expanded(
                child: Column(children:[ 
                 const Spacer(flex: 1,),
                 const Padding(
                    padding:  EdgeInsets.only(bottom:20.0),
                    child: const Text('Version: ${AppConstants.version}',style:const TextStyle(color: Colors.white),))]),
              )
            ],
          )),
          
      appBar: AppBar(
        backgroundColor:const Color(0xff0A192F),
        elevation: 0.0,
        centerTitle: false,
        actions: [
          Padding(padding: EdgeInsets.all(8),child:
            Builder(
              builder: (context) => IconButton(
                    icon: FaIcon(FontAwesomeIcons.bars,color: Colors.white,size: 20,),
                    onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
            ),
          )
        ],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              _scrollToIndex(0);
            },
            child:const Image(
              fit: BoxFit.fitHeight,
                            height: 40,
                            width: 40,
              image:  AssetImage("images/website_logo_3.png"),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _autoScrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _wrapScrollTag(index: 0, child: 
              LandingMobile(size: size),),
              SizedBox(
                height: size.height * 0.08,
              ),

              //About me
              _wrapScrollTag(index: 1, child:
              AboutMobile(
                size: size,
              ),),
              //Where I've Worked title
              _wrapScrollTag(index: 2, child:
              WorkMobile(size: size),),

              // MobileWork(),

              SizedBox(
                height: size.height * 0.07,
              ),
              _wrapScrollTag(index: 3, child:
              ProjectShowcaseMobile(size: size),),
              //Some Things I've Built title
              /* Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "3.",
                    textsize: 20.0,
                    color: Color(0xff61F9D5),
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  CustomText(
                    text: "Some Things I've Built",
                    textsize: 26.0,
                    color: Color(0xffCCD6F6),
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Container(
                    width: size.width * 0.04,
                    height: 1.10,
                    color: Color(0xff303C55),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

             /*  MobileProject(
                ontab: () {},
                image: "images/pic9.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic2.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic3.png",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic4.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic5.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic6.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic7.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic8.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic10.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic11.jpg",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic102.gif",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic104.png",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic105.png",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic106.png",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic107.jfif",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic108.jfif",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic109.jfif",
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              MobileProject(
                ontab: () {},
                image: "images/pic110.jfif",
              ),

              SizedBox(
                height: size.height * 0.07,
              ), */

              Row(
                children: [
                  Container(
                    width: size.width * 0.42,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic101.png"),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: size.width * 0.42,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic103.png"),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              Row(
                children: [
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic111.gif"),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic113.jfif"),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              Row(
                children: [
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic114.png"),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic115.png"),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              Row(
                children: [
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic116.jfif"),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic117.png"),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              Row(
                children: [
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic118.jpeg"),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic119.jpeg"),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              Row(
                children: [
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic120.png"),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.6,
                    child: Image(
                      image: AssetImage("images/pic121.png"),
                    ),
                  ),
                ],
              ),
 */
              SizedBox(
                height: size.height * 0.07,
              ),
              _wrapScrollTag(index: 4, child: 
              ContactMeMobile(size: size),),

              SizedBox(
                height: size.height * 0.07,
              ),

              SocialIconsMobile(),

              SizedBox(
                height: size.height * 0.07,
              ),

              //Footer
              MobileFooter()
            ],
          ),
        ),
      ),
    );
  }
}
