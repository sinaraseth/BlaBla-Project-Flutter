import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/theme/theme.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        style: TextStyle(color: BlaColors.neutralDark),
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.arrow_back_ios, color: BlaColors.neutralLighter,),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: BlaColors.neutralLighter,),
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                )
              : null,
            hintText: "Search location...",
            hintStyle: TextStyle(color: BlaColors.neutralLight),
          fillColor: BlaColors.greyLight,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BlaSpacings.radius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}