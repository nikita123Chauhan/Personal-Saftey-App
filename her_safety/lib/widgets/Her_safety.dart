import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:her_safety/widgets/home_widgets/Her_safety/BusStationCard.dart';
import 'package:her_safety/widgets/home_widgets/Her_safety/HospitalCard.dart';
import 'package:her_safety/widgets/home_widgets/Her_safety/PharmacyCard.dart';
import 'package:her_safety/widgets/home_widgets/Her_safety/PoliceStationCard.dart';
import 'package:url_launcher/url_launcher.dart';

class Her_Safety extends StatelessWidget {
  const Her_Safety({Key? key}) : super(key: key);

  static Future<void> openMap(String location) async {
    String query = Uri.encodeComponent(location);
    String googleUrl = 'https://www.google.com/maps/search/$query';

    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(
        Uri.parse(googleUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      Fluttertoast.showToast(msg: 'Could not open Google Maps');
      throw 'Could not launch $googleUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceStationCard(onMapFunction: openMap),
          HospitalCard(onMapFunction: openMap),
          PharmacyCard(onMapFunction: openMap),
          BusStationCard(onMapFunction: openMap),
        ],
      ),
    );
  }
}
