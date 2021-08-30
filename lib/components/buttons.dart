import 'package:flutter/material.dart';
import 'package:price_compare/theme/themeStyles.dart';

class RoundedShapeButton extends StatelessWidget {
  final String? title;
  final Function onClick;
  final Color? bgColor;
  final TextStyle? textStyle;
  RoundedShapeButton(
      {this.title, required this.onClick, this.bgColor, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        elevation: 0.0,
        onPressed: onClick as void Function()?,
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: bgColor ?? Colors.white,
        child: Text(
          '${title ?? ''} ',
          style: textStyle ?? ThemeStyles.normalText,
        ),
      ),
    );
  }
}
