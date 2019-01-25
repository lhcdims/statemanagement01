// This example tries to demonstrate how to maintain the state of widgets when
// variables are changed by External Event
// e.g. by a timer of another thread, or by socket.io
// This example uses setState and a timer to maintain States of Multiple Pages

// import flutter darts
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:threading/threading.dart";

// import self darts
import 'gv.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'ScreenVariables.dart';


// Main Program
void main() {
  // Create a new thread to simulate an External Event that changes a global variable defined in gv.dart
  var threadExternal = new Thread(funTimerExternal);
  threadExternal.start();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
      // Init Screen Variables
      sv.Init();

      // Run MainApp
      runApp(new MyApp());
  });
}


// The following function simulates an External Event
// e.g. a global variable is changed by socket.io and see how all widgets react with this global variable
void funTimerExternal() async {
  while (true) {
    await Thread.sleep(1000);
    gv.gintCount += 1;
  }
}



// Main App
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
    // Set funTimerDefault, to listen to change of Vars
    var threadTimerDefault = new Thread(funTimerDefault);
    threadTimerDefault.start();
  }

  void funTimerDefault() async {
    while (true) {
      // Allow this thread to run each XXX milliseconds
      await Thread.sleep(500);

      // Check any changes need to setState here

      // If anything changes
      // setState according to gv.gstrCurPage
      if (gv.gintCount != gv.gintCountLast) {
        gv.gintCountLast = gv.gintCount;
        switch (gv.gstrCurPage) {
          case 'page1':
            // Page 1: Refresh Page
            setState(() {});
            break;
          case 'page2':
            // Page 2: Refresh Page
            setState(() {});
            break;
          default:
            // Page 3: Do Nothing, since Page 3 is static
            break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disable Show Debug
      debugShowCheckedModeBanner: false,

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
    // Here Return Page According to gv.gstrCurPage
    switch (gv.gstrCurPage) {
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
    // The following code will never be run, to avoid warning only
    return ClsPage1();
  }
}
