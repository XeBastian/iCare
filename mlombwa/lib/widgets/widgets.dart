// DefaultFormField

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    Key? key,
    this.controller,
    this.label,
    this.label2,
    this.obscureText = false,
    this.suffixICon,
    this.textInputType,
    this.maxLines = 1,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? label;
  final String? label2;
  final bool obscureText;
  final IconData? suffixICon;
  final TextInputType? textInputType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: Get.isDarkMode ? Colors.white24 : Colors.black26,
        suffix: Icon(suffixICon),
        filled: true,
        hintText: '$label',
        hintStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white38 : Colors.black26,
        ),
      ),
      maxLines: maxLines,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}

// SLiverAppBar
