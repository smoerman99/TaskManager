import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String text;

  const TextWidget({Key key, this.text}) : super(key: key);
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(widget.text));
  }
}

// // ignore: must_be_immutable
// class TextWidget extends StatefulWidget {
//   String myText = "";

//   TextWidget(this.myText);

//   @override
//   _TextWidgetState createState() => _TextWidgetState(myText);
// }

// class _TextWidgetState extends State<TextWidget> {
//   String myText = "";

//   _TextWidgetState(this.myText);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(myText),
//     );
//   }
// }
