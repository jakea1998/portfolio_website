import 'package:app_portfolio/constants/app_constants.dart';
import 'package:app_portfolio/widgets/animated_image_overlay.dart';
import 'package:app_portfolio/widgets/app_showcase_model.dart';
import 'package:app_portfolio/widgets/external_link_button.dart';
import 'package:app_portfolio/widgets/interactive_image_viewer.dart';
import 'package:app_portfolio/widgets/source_aware_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowcaseAppItem extends StatelessWidget {
  final ShowcaseAppModel app;
  final bool displayOverlay;
  const ShowcaseAppItem(
    this.app,  {
      this.displayOverlay = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
        bottomLeft: Radius.circular(4.0),
        bottomRight: Radius.circular(4.0),
      ),
      child: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
              // When overlay tapped, open full screen interactive image viewer.
              onTap: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (_, __, ___) {
                    return InteractiveImageViewer(
                      image: app.image,
                      isNetworkImage: app.isNetworkImage,
                    );
                  },
                );
              },
              
            child: _buildChild()),
         
        ],
      ),
    );
  }

  Widget _buildChild() {
    return Container(
      color: AppConstants.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SourceAwareImage(
                image: app.image,
                isNetworkImage: app.isNetworkImage,
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: displayOverlay ? AnimatedImageOverlay(app.topic) : Container()),
            ],
          ),
          _buildBottom(),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppName(),
              const Divider(
                color: AppConstants.dividerColor,
                thickness: 1.5,
                height: 32.0,
              ),
            ],
          ),
          if (app.playStoreURL != null) ...[
            ExternalLinkButton(
              url: app.playStoreURL!,
              iconData: FontAwesomeIcons.googlePlay,
              label: 'Play Store',
            ),
            const SizedBox(height: 10.0),
          ],
          if (app.appStoreURL != null) ...[
            ExternalLinkButton(
              url: app.appStoreURL!,
              iconData: FontAwesomeIcons.appStoreIos,
              label: 'App Store',
            ),
            const SizedBox(height: 10.0),
          ],
          if (app.githubURL != null)
            ExternalLinkButton(
              url: app.githubURL!,
              iconData: FontAwesomeIcons.squareGithub,
              label: 'GitHub',
            ),
        ],
      ),
    );
  }

  Widget _buildAppName() {
    return Text(
      app.name,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 1.4,
      ),
    );
  }
}
