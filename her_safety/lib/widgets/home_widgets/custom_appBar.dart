import 'package:flutter/material.dart';
import 'package:her_safety/utils/quotes.dart';

class CustomAppBar extends StatelessWidget {
  //const CustomAppBar({super.key});
  final Function onTap;
  final int quoteIndex;
  const CustomAppBar({required this.quoteIndex, required this.onTap, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },

      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(sweetSayings[quoteIndex], style: TextStyle(fontSize: 26)),
      ),
    );
  }
}
