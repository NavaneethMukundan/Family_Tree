import 'package:family_tree/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.controller,
      this.iconsize = 28,
      this.textHeight = 10,
      this.padding = 20,
      this.color = kBlack,
      this.radius = 15,
      this.iconcolor = kBlack,
      this.hiddentext = false,
      this.validate = false,
      this.isNumber = false,
      this.onChanged,
      this.sufixIcon})
      : super(key: key);
  final bool isNumber ;
  final bool validate ;
  final void Function(String)? onChanged;
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
  final bool hiddentext;
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
      keyboardType: isNumber ? TextInputType.number : null,
      inputFormatters: isNumber
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
      validator: (value) {
        if (!validate) return null;
        if (value == null || value.isEmpty) {
          return "Please fill this field";
        } else {
          return null;
        }
      },
    );
  }
}
