// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ldp_prediction/constant/responsive_state.dart';
import 'package:ldp_prediction/constant/view_state.dart';
//import 'package:ldp_prediction/utils/sizeConfig.dart';
import 'package:ldp_prediction/utils/text_style.dart';

 

class CustomButtonLoad extends StatelessWidget {
  const CustomButtonLoad({
    super.key,
    this.onTap,
    required this.label,
    this.textColor = Colors.white,
    this.buttonColor,
    this.height,
    this.borderColor,
    required this.userProv,
  });

  final String label;
  final Color? buttonColor;
  final Color? textColor;
  final double? height;
  final Color? borderColor;
  final VoidCallback? onTap;
  final ViewState userProv;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: userProv == ViewState.Busy ? null : onTap,
      child: Container(
        height: height ?? 45,
        decoration: BoxDecoration(
          color: onTap == null ? Colors.grey : buttonColor ?? Colors.blue,
          // border: Border.all(color: borderColor ?? appPrimaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: ResponsiveState(
            state: userProv,
            idleWidget: Text(
              label,
              textAlign: TextAlign.center,
              style: txStyle15.copyWith(
                  color: textColor ?? Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            busyWidget: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                )),
          ),
        ),
      ),
    );
  }
}
