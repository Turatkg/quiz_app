//--------------------SurooText----------------------//
import 'package:flutter/material.dart';

class SurooText extends StatelessWidget {
  String text;

  SurooText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple),
      ),
    );
  }
}

//---------------variant-------------------//
class Joop extends StatelessWidget {
  final String joop;
  final Function joopBer;

  Joop({
    required this.joop,
    required this.joopBer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          joopBer(joop);
        },
        child: Text(joop),
      ),
    );
  }
}
//------------------------End-------------------------------//
