    // This example tries to demonstrate how to maintain the state of widgets when
    // variables are changed by External Event
    // e.g. by a timer of another thread, or by socket.io
    // This example uses setState and a timer to maintain States of Multiple Pages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:threading/threading.dart";

import 'gv.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'ScreenVariables.dart';


void main() {  // Main Program
  var threadExternal = new Thread(funTimerExternal);    // Create a new thread to simulate an External Event that changes a global variable defined in gv.dart
  threadExternal.start();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
      sv.Init();        // Init Screen Variables

      runApp(new MyApp());        // Run MainApp
  });
}


void funTimerExternal() async {  // The following function simulates an External Event  e.g. a global variable is changed by socket.io and see how all widgets react with this global variable
  while (true) {
    await Thread.sleep(1000);
    gv.gintCount += 1;
  }
}



class MyApp extends StatefulWidget {  // Main App
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
    var threadTimerDefault = new Thread(funTimerDefault);      // *** Set funTimerDefault, to listen to change of Vars ***
    threadTimerDefault.start();
  }

  void funTimerDefault() async {
    while (true) {
      await Thread.sleep(500);        // Allow this thread to run each XXX milliseconds

      if (gv.gintCount != gv.gintCountLast) {        // Check any changes need to setState here, if anything changes, setState according to gv.gstrCurPage
        gv.gintCountLast = gv.gintCount;
        switch (gv.gstrCurPage) {
          case 'page1':
            setState(() {});              // Page 1: Refresh Page
            break;
          case 'page2':
            setState(() {});              // Page 2: Refresh Page
            break;
          default:              // Page 3: Do Nothing, since Page 3 is static
            break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,        // Disable Show Debug

      home: MainBody(),
    );
  }
}
class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}
class _MainBodyState extends State<MainBody> {
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    switch (gv.gstrCurPage) {      // Here Return Page According to gv.gstrCurPage
      case 'page1':
        return ClsPage1();
        break;
      case 'page2':
        return ClsPage2();
        break;
      default:
        return ClsPage3();
        break;
    }
    return ClsPage1();      // The following code will never be run, to avoid warning only
  }
}
