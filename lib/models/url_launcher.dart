import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {

  launchURL(String link) async {
  var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



launchEmail() async {
      if (await canLaunch("mailto:jake_stegeman@yahoo.com")) {
        await launch("mailto:jake_stegeman@yahoo.com");
      } else {
        throw 'Could not launch';
      }
    }

}