import 'package:flutter/material.dart';
import 'package:her_safety/widgets/home_widgets/emergencies/AmbulanceEmergency.dart';
import 'package:her_safety/widgets/home_widgets/emergencies/ArmyEmergency.dart';
import 'package:her_safety/widgets/home_widgets/emergencies/FirebrigadeEmergency.dart';
import 'package:her_safety/widgets/home_widgets/emergencies/PoliceEmergency.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  final PageController _controller = PageController(); // Page Controller

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200, // Fixed height for cards
          child: PageView(
            controller: _controller,
            children: [
              PoliceEmergency(),
              AmbulanceEmergency(),
              FirebrigadeEmergency(),
              ArmyEmergency(),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Dot Indicator
        SmoothPageIndicator(
          controller: _controller,
          count: 4, // Number of cards
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.redAccent,
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 6,
          ),
          onDotClicked: (index) {
            _controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
        ),
      ],
    );
  }
}
