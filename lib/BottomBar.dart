// This program contains the Class for the Bottom Navigator Bar

// Import Flutter Darts
import 'package:flutter/material.dart';

// Import Self Darts
import 'gv.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';

// Class Bottom
class ClsBottom extends StatefulWidget {
  @override
  _ClsBottomState createState() => _ClsBottomState();
}

class _ClsBottomState extends State<ClsBottom> {
  @override
  initState() {
    super.initState();
    // Add listeners to this class, if any
  }

  void _onItemTapped(int index) {
    gv.gintBottomIndex = index;
    gv.gbolNavigatorBeingPushed = true;
    switch (index) {
      case 0:
      // Page 1 Clicked
        gv.gstrCurPage = 'page1';

        // Goto Home
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClsPage1()),
        );
        Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
        break;
      case 1:
      // Page 2 Clicked
        gv.gstrCurPage = 'page2';

        // Goto Home
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClsPage2()),
        );
        Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
        break;
      default:
      // Page 3 Clicked
        gv.gstrCurPage = 'page3';

        // Goto Home
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClsPage3()),
        );
        Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text('Page 1')),
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text('Page 2')),
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text('Page 3')),
      ],
      currentIndex: gv.gintBottomIndex,
      fixedColor: Colors.deepPurple,
      onTap: _onItemTapped,
    );
  }
}