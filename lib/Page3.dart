// This program display the static Page 3

// Import Flutter Darts
import 'package:flutter/material.dart';

// Import Self Darts
import 'BottomBar.dart';
import 'gv.dart';
import 'ScreenVariables.dart';

// Home Page
class ClsPage3 extends StatefulWidget {
  @override
  _ClsPage3State createState() => _ClsPage3State();
}

class _ClsPage3State extends State<ClsPage3> {
  @override
  initState() {
    super.initState();
    // Add listeners to this class, if any
    if (gv.gbolNavigatorBeingPushed) {
      gv.gbolNavigatorBeingPushed = false;
    } else {
      gv.gintPage3Counter += 1;
      print('Page 3 Init Counter: ' + gv.gintPage3Counter.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(
            'Page 3 Static Page',
            style: TextStyle(fontSize: sv.dblDefaultFontSize),
          ),
        ),
        preferredSize: new Size.fromHeight(sv.dblTopHeight),
      ),
      body: Center(
        child: Container(
          color: Colors.greenAccent,
          height: sv.dblBodyHeight,
          width: sv.dblScreenWidth,
          child: Center(
            child: Text(
              'Page 3 Init Counter: ' + gv.gintPage3Counter.toString(),
              style: TextStyle(fontSize: sv.dblDefaultFontSize),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClsBottom(),
    );
  }
}
