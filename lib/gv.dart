import 'package:flutter/material.dart';
class gv {
  static var gstrCurPage = 'page1'; // gstrCurPage stores the Current Page to be loaded

  static var gintBottomIndex = 0; // Which Tab is selected in the Bottom Navigator Bar

  static var gintCount = 0; // The Global Counter
  static var gintCountLast = 0; // Check whether Global Counter has been changed

  static var gintPage1Counter = 0; // No. of initState called in Page 1
  static var gintPage2Counter = 0; // No. of initState called in Page 2
  static var gintPage3Counter = 0; // No. of initState called in Page 3

  static bool gbolNavigatorBeingPushed = false; // Since Navigator.push will called the initState TWICE, this variable make sure the initState only be called once effectively!

  static var gctlPage2Text = TextEditingController(); // Controller for the text field in Page 2
}