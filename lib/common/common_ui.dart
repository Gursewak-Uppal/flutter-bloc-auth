import 'package:flutter/material.dart';
import 'package:flutter_bloc_auth/core/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget appButton({
  required Color? bkColor,
  String text = '',
  double height = 55.0,
  GestureTapCallback? onTapped,
}) =>
    GestureDetector(
      onTap: onTapped,
      child: Container(
        height: height,
        decoration: BoxDecoration(color: bkColor, borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppStyles.buttonText,
          ),
        ),
      ),
    );

Widget extendedHeader({GestureTapCallback? onTapped, bool backNavigation = true, required BuildContext context, required String text}) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (backNavigation)
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onTapped ?? () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 20.0),
          child: Text(
            text,
            style: AppStyles.appBarText,
          ),
        )
      ],
    );

void showToastMsg(String msg, {bool hasErrorMessage = false}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: hasErrorMessage ? Colors.red : const Color(0xff00b09b),
      textColor: Colors.white,
      webBgColor: hasErrorMessage ? "linear-gradient(to right, #F3213D8F, #DA062DFF)" : "linear-gradient(to right, #00b09b, #96c93d)",
      fontSize: 16.0);
}
