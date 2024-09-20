import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Make sure this is imported

import '../constants.dart';
import 'default_button.dart';

class HireMeCard extends StatelessWidget {
  const HireMeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/email.png",
            height: 80,
            width: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              height: 80,
              child: VerticalDivider(),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Starting New Project?",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: kDefaultPadding / 2),
                Text(
                  "Get an estimate for the new project",
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          DefaultButton(
            text: "Hire Me!",
            color: Colors.deepPurple,
            imageSrc: "assets/images/hand.png",
            press: _launchEmail, // Update the press function
          )
        ],
      ),
    );
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
