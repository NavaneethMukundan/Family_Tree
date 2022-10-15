import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
   TextFormWidget(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.iconsize,
      required this.textHeight,
      required this.padding,
      required this.color,
      required this.radius,
      required this.iconcolor,
      required this.controller,
      this.hiddentext = false,
      this.validate = false,
      this.onChanged, 
      this.sufixIcon})
      : super(key: key);
  bool validate= false;
  void Function(String)? onChanged;
  final IconData icon;
  final IconButton? sufixIcon;
  final String hintText;
  final double iconsize;
  final double textHeight;
  final double padding;
  final Color color;
  final Color iconcolor;
  final double radius;
  final TextEditingController controller;
   bool hiddentext = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: hiddentext, 
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(padding),
        labelText: hintText,
        prefixIcon: Icon(
          icon,
          color: iconcolor,
          size: iconsize,
        ),
        suffixIcon: sufixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: color)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: color),
        ),
      ),
      validator: (value) {
        if(!validate) return null;
        if (value == null || value.isEmpty) {
          return "Value is required";
        } else {
          return null;
        }
      },
    );
  }
}
