import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatefulWidget {
  String myText = "";

  TextWidget(this.myText);

  @override
  _TextWidgetState createState() => _TextWidgetState(myText);
}

class _TextWidgetState extends State<TextWidget> {
  String myText = "";

  _TextWidgetState(this.myText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(myText),
    );
  }
}
