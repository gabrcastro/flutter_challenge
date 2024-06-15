import 'package:flutter/material.dart';
import 'package:tractian_challenge/ui/themes/colors.dart';
import 'package:tractian_challenge/ui/ui.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: gray,
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        label: Text(UI.strings.getActiveOrLocal),
        labelStyle: TextStyle(
          color: gray,
          fontSize: 16.0,
        ),
        prefixIcon: Icon(Icons.search, color: gray,),
        filled: true,
        fillColor: grayLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        )
      ),
    );
  }
}
