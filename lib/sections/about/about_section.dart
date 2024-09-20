import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/default_button.dart';
import '../../components/my_outline_button.dart';
import '../../constants.dart';
import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AboutTextWithSign(),
              Expanded(
                child: AboutSectionText(
                  text:
                  "Raifel TS is an experienced developer specializing in PHP Laravel and Flutter. With a strong background in web and mobile app development, Raifel has successfully completed several major projects in both domains.",
                ),
              ),
              ExperienceCard(numOfExp: "01"),
              Expanded(
                child: AboutSectionText(
                  text:
                  "Raifel holds a Bachelor's degree in Computer Science and Engineering from APJ Abdul Kalam Technological University. Proficient in multiple programming languages, Raifel is also skilled in database design and mobile app development.",
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyOutlineButton(
                imageSrc: "assets/images/hand.png",
                text: "Hire Me!",
                press: _launchEmail,
              ),
              SizedBox(width: kDefaultPadding * 1.5),
              DefaultButton(
                imageSrc: "assets/images/download.png",
                text: "Download CV",
                color: Colors.blue,
                press: _downloadCV,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _downloadCV() async {
    final url = Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/flutter-web-713e6.appspot.com/o/Raifel_cv.pdf?alt=media&token=98b856c9-2582-42ae-a473-c9db2a2c7a17'); // Replace with your file link

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication); // Open in a new tab
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchEmail() async {
    final emailUri = Uri(
      scheme: 'mailto',
      path: 'raifelts@gmail.com', // Your email address
      query: Uri.encodeQueryComponent('Subject: Inquiry'), // Optional subject
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch email client';
    }
  }
}
