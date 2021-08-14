import 'package:flutter/material.dart';
import 'package:price_compare/theme/themeStyles.dart';

class BoxTextField extends StatelessWidget {
  final Function onChange;
  final String label;
  final String hintText;
  final String errorText;
  final String initialValue;
  final TextInputType keyboard;

  BoxTextField({
    @required this.onChange,
    @required this.label,
    @required this.hintText,
    @required this.initialValue,
    @required this.keyboard,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: ThemeColor.primeryColor),
        hintText: hintText,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: ThemeColor.primeryColor),
        labelText: label,
        errorText: errorText,
        filled: true,
        hoverColor: ThemeColor.primeryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.smoothDangerColor,
            width: 1.0,
          ),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
          ),
        ),
      ),
      onChanged: (text) => onChange(text),
    );
  }
}

class BoxTextFieldWithTextChange extends StatelessWidget {
  final Function onChange;
  final String label;
  final String hintText;
  final String errorText;
  final String text;
  final TextInputType keyboard;
  final FocusNode myFocusNode;

  BoxTextFieldWithTextChange(
      {@required this.onChange,
      @required this.label,
      @required this.hintText,
      @required this.text,
      @required this.keyboard,
      this.errorText,
      this.myFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      focusNode: myFocusNode,
      controller: TextEditingController(text: text),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: ThemeColor.primeryColor),
        hintText: hintText,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: ThemeColor.primeryColor),
        labelText: label,
        errorText: errorText,
        filled: true,
        hoverColor: ThemeColor.primeryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.smoothDangerColor,
            width: 1.0,
          ),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
          ),
        ),
      ),
      onChanged: (text) => onChange(text),
    );
  }
}

class BoxTextFieldWithSuffext extends StatelessWidget {
  final Function onChange;
  final String label;
  final String hintText;
  final String errorText;
  final String initialValue;
  final TextInputType keyboard;
  final Widget suffex;
  final bool obscured;

  BoxTextFieldWithSuffext({
    @required this.onChange,
    @required this.label,
    @required this.hintText,
    @required this.initialValue,
    @required this.keyboard,
    @required this.suffex,
    this.errorText,
    this.obscured = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      initialValue: initialValue,
      obscureText: obscured,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: ThemeColor.primeryColor),
        hintText: hintText,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: ThemeColor.primeryColor),
        labelText: label,
        errorText: errorText,
        filled: true,
        hoverColor: ThemeColor.primeryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.smoothDangerColor,
            width: 1.0,
          ),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
          ),
        ),
        suffixIcon: suffex,
      ),
      onChanged: (text) => onChange(text),
    );
  }
}

class BoxTextFieldWithPrefix extends StatelessWidget {
  final Function onChange;
  final String label;
  final String hintText;
  final String errorText;
  final String initialValue;
  final TextInputType keyboard;
  final Widget prefix;

  BoxTextFieldWithPrefix({
    @required this.onChange,
    @required this.label,
    @required this.hintText,
    @required this.initialValue,
    @required this.keyboard,
    @required this.prefix,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: ThemeColor.primeryColor),
        hintText: hintText,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: ThemeColor.primeryColor),
        labelText: label,
        errorText: errorText,
        filled: true,
        hoverColor: ThemeColor.primeryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.smoothDangerColor,
            width: 1.0,
          ),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ThemeColor.primeryColor,
          ),
        ),
        prefixIcon: prefix,
      ),
      onChanged: (text) => onChange(text),
    );
  }
}
