import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/models/url_launcher.dart';
import 'package:app_portfolio/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ContactMeDesktop extends StatelessWidget {
  final Size size;
  ContactMeDesktop({super.key,required this.size});
  final method = UrlLauncher();
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: size.height * 0.38,
      width: MediaQuery.of(context).size.width - 100,
      // color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: "4. What's Next?",
            textsize: 16.0,
            color: AppConstants.secondaryColor,
            letterSpacing: 3.0,
          ),
          SizedBox(
            height: 16.0,
          ),
          CustomText(
            text: "Get In Touch",
            textsize: 42.0,
            color: Colors.white,
            letterSpacing: 3.0,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 16.0,
          ),
          Wrap(
            children: [
              Text(
                "If you'd like to contact me regarding a job opportunity, project, or would like to request references,\n please reach out! I'll get back to you as soon as possible.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  letterSpacing: 0.75,
                  fontSize: 17.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32.0,
          ),
          InkWell(
            onTap: () {
              method.launchEmail();
            },
            child: Card(
              elevation: 4.0,
              color: AppConstants.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Container(
                margin: EdgeInsets.all(0.85),
                height: size.height * 0.09,
                width: size.width * 0.10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff0A192F),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Text(
                    "Say Hello",
                    style: TextStyle(
                      color: AppConstants.secondaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
