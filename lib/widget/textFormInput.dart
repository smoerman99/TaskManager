import 'package:flutter/material.dart';

class TextFormInput extends StatefulWidget {
  final String labelText;
  final TextEditingController myTextEditingController;

  const TextFormInput(
      {@required this.labelText, @required this.myTextEditingController});

  @override
  _TextFormInputState createState() => _TextFormInputState();
}

class _TextFormInputState extends State<TextFormInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: widget.myTextEditingController,
      cursorColor: Color(12),
      decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          labelText: widget.labelText),
    );
  }
}
