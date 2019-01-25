// This program stores ALL global variables required by ALL darts

// Import Flutter Darts
import 'package:flutter/material.dart';

// Import Self Darts

// Import Pages

class gv {
  // Current Page
  // gstrCurPage stores the Current Page to be loaded
  static var gstrCurPage = 'page1';

  // Init gintBottomIndex
  // i.e. Which Tab is selected in the Bottom Navigator Bar
  static var gintBottomIndex = 0;

  // A Global Counter gintCount
  // gintCountLast is to keep track whether the gintCount has been changed
  static var gintCount = 0;
  static var gintCountLast = 0;


  // A Counter for Number of Refresb
  static var gintPage1Counter = 0;
  static var gintPage2Counter = 0;
  static var gintPage3Counter = 0;

  // Since Navigator.push will called the initState TWICE
  // This variable make sure the initState only called once!
  static bool gbolNavigatorBeingPushed = false;

  // A variable control the Text Field in Page 2
  static var gctlPage2Text = TextEditingController();
}
