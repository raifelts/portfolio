import 'package:flutter/material.dart';
import 'package:web_app/constants.dart';
import 'package:web_app/sections/about/about_section.dart';
import 'package:web_app/sections/contact/contact_section.dart';
import 'package:web_app/sections/feedback/feedback_section.dart';
import 'package:web_app/sections/recent_work/recent_work_section.dart';
import 'package:web_app/sections/service/service_section.dart';
import 'package:web_app/sections/topSection/components/logo_blur_box.dart';
import 'package:web_app/sections/topSection/components/menu.dart';
import 'package:web_app/sections/topSection/components/person_pic.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey homeKey = GlobalKey(); // Add GlobalKey for Home section
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey serviceKey = GlobalKey();
  final GlobalKey recentWorkKey = GlobalKey();
  final GlobalKey feedbackKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Wrap the top section with the homeKey
                Container(
                  key: homeKey, // Assign the homeKey here
                  alignment: Alignment.center,
                  constraints: BoxConstraints(maxHeight: 900, minHeight: 700),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/background.png"),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: kDefaultPadding),
                    width: 1200,
                    child: Stack(
                      children: [
                        LogoAndBlurBox(size: size),
                        Positioned(
                          bottom: 0, // Adjusted space between the PersonPic and the menu
                          right: 0,
                          child: PersonPic(),
                        ),
                        // Position the Menu below the PersonPic
                        Positioned(
                          bottom: 0, // Adjust this value to align the menu perfectly below the PersonPic
                          left: 0,
                          right: 0,
                          child: Menu(
                            onMenuItemSelected: (index) {
                              switch (index) {
                                case 0: // Home
                                  scrollToSection(homeKey); // Scroll to the Home section
                                  break;
                                case 1:
                                  scrollToSection(aboutKey);
                                  break;
                                case 2:
                                  scrollToSection(serviceKey);
                                  break;
                                case 3:
                                  scrollToSection(recentWorkKey);
                                  break;
                                case 4:
                                  scrollToSection(feedbackKey);
                                  break;
                                case 5:
                                  scrollToSection(contactKey);
                                  break;
                                default:
                                  break;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: kDefaultPadding * 2),
                // Other sections with GlobalKeys
                Container(key: aboutKey, child: AboutSection()),
                Container(key: serviceKey, child: ServiceSection()),
                Container(key: recentWorkKey, child: RecentWorkSection()),
                Container(key: feedbackKey, child: FeedbackSection()),
                SizedBox(height: kDefaultPadding),
                Container(key: contactKey, child: ContactSection()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

