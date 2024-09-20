import 'package:flutter/material.dart';
import 'package:web_app/models/Feedback.dart';
import '../../../constants.dart';

class FeedbackCard extends StatefulWidget {
  const FeedbackCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  _FeedbackCardState createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  Duration duration = const Duration(milliseconds: 200);
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent, // Removes the splash effect
      highlightColor: Colors.transparent, // Removes the tap highlight effect
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: duration,
        margin: EdgeInsets.only(top: kDefaultPadding * 2),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: 350,
        width: 340,
        decoration: BoxDecoration(
          color: feedbacks[widget.index].color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (isHover)
              BoxShadow(
                offset: Offset(0, 20),
                blurRadius: 30,
                color: Colors.black.withOpacity(0.2),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              transform: isHover ? Matrix4.translationValues(0, -20, 0) : Matrix4.translationValues(0, 0, 0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 8),
                  boxShadow: [
                    if (!isHover) kDefaultCardShadow,
                  ],
                  image: DecorationImage(
                    image: AssetImage(feedbacks[widget.index].userPic),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Text(
              feedbacks[widget.index].review,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
            SizedBox(height: kDefaultPadding * 2),
            Text(
              feedbacks[widget.index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
