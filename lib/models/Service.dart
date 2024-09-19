import 'package:flutter/material.dart';

class Service {
  final int id;
  final String title, image;
  final Color color;

  Service({required this.id, required this.title, required this.image, required this.color});
}

// For demo list of service
List<Service> services = [
  Service(
    id: 1,
    title: "App Developing",
    image: "assets/images/app_developing.png",
    color: Color(0xFFD9FFFC),
  ),
  Service(
    id: 2,
    title: "UI Design",
    image: "assets/images/ui.png",
    color: Color(0xFFE4FFC7),
  ),
  Service(
    id: 3,
    title: "Web Developing",
    image: "assets/images/web_developing.png",
    color: Color(0xFFFFF3DD),
  ),
  Service(
    id: 4,
    title: "Interaction Design",
    image: "assets/images/Intreaction_design.png",
    color: Color(0xFFFFE0E0),
  ),
];
