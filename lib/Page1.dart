// This program display Page 1

// Import Flutter Darts
import 'package:flutter/material.dart';

// Import Self Darts
import 'BottomBar.dart';
import 'gv.dart';
import 'ScreenVariables.dart';

// Home Page
class ClsPage1 extends StatefulWidget {
  @override
  _ClsPage1State createState() => _ClsPage1State();
}

class _ClsPage1State extends State<ClsPage1> {
  @override
  initState() {
    super.initState();
    // Add listeners to this class, if any
    if (gv.gbolNavigatorBeingPushed) {
      gv.gbolNavigatorBeingPushed = false;
    } else {
      gv.gintPage1Counter += 1;
      print('Page 1 Init Counter: ' + gv.gintPage1Counter.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(
            'Page 1 - Dynamic Page',
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Page 1 Init Counter: ' + gv.gintPage1Counter.toString(),
                    style: TextStyle(fontSize: sv.dblDefaultFontSize),
                    textAlign: TextAlign.left,
                  ),
                  Text(' '),
                  Text(
                    'Global Counter: ' + gv.gintCount.toString(),
                    style: TextStyle(fontSize: sv.dblDefaultFontSize),
                    textAlign: TextAlign.left,
                  ),
                ]),
          ),
        ),
      ),
      bottomNavigationBar: ClsBottom(),
    );
  }
}
