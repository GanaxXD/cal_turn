import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {

  Function apertar;
  String text;

  CircularButton({this.apertar, this.text});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: apertar,
        child: Text(text, style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),textAlign: TextAlign.center,
        ),
      color: Colors.green,
    );
  }
}
