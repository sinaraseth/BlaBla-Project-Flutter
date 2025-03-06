import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/theme/theme.dart';

class BlaButton extends StatelessWidget {
  final Icon? icon;
  final VoidCallback onPressed; // to do some action
  final String type; // set to know what type of button ( primary and secondary)
  final String text;
  final double? iconSize;

  const BlaButton({
    super.key,
    this.icon,
    required this.onPressed,
    required this.type,
    required this.text,
    this.iconSize = 18.0 ,
  });

  @override
  Widget build(BuildContext context) {
    
    // Create the icon with the specified size and match with text is better
    final Icon? sizedIcon = icon != null 
        ? Icon(
            icon!.icon,
            size: iconSize,
            color: icon!.color,
            semanticLabel: icon!.semanticLabel,
          ) 
        : null;

    // set condition for primary and secondary button
    if (type == 'PRIMARY') {
      return ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(
          text,
          style: BlaTextStyles.label,
        ),
        icon: sizedIcon ?? const SizedBox(), // set when button do not contain icon
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(BlaColors.primary),
            foregroundColor: WidgetStateProperty.all(BlaColors.white),
            minimumSize: WidgetStateProperty.all(Size(88, 50)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(BlaSpacings.radius),
                    bottomRight: Radius.circular(BlaSpacings.radius))))),
      );
    }

    // Secondary Button
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(
        text,
        style: BlaTextStyles.label,
      ),
      icon: sizedIcon ?? const SizedBox(), // set when button do not contain icon
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(BlaColors.white),
        foregroundColor: WidgetStateProperty.all(BlaColors.primary),
        minimumSize: WidgetStateProperty.all(Size(88, 50)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BlaSpacings.radiusLarge),
            side: BorderSide(
              color: BlaColors.neutralLight,
              width: 0.2,
            ),
          ),
        ),
      ),
    );
  }
}