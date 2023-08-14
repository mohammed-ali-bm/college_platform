import 'package:day34/pages/enquiriesPage.dart';
import 'package:day34/pages/explore.dart';
import 'package:day34/pages/notes.dart';

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _myPage;
  int _selectedPage = 0;

  List<Widget> pages = [
    ExplorePage(),
    EnquiriesPage(),
    NotesPage(),
    // NotificationsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;

      print(_selectedPage);
      _myPage.jumpToPage(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _myPage = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageView(
          controller: _myPage,
          children: [...pages],
        ),
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: FlashyTabBar(
          selectedIndex: _selectedPage,
          showElevation: false,
          onItemSelected: (index) => _onItemTapped(index),
          items: [
            FlashyTabBarItem(
              activeColor: Color.fromRGBO(8, 52, 142, 1),
              inactiveColor: Color.fromRGBO(100, 100, 100, 1),
              icon: Icon(CupertinoIcons.question, size: 17),
              title: Text('Quzzies'),
            ),
            FlashyTabBarItem(
              activeColor: Color.fromRGBO(8, 52, 142, 1),
              inactiveColor: Color.fromRGBO(100, 100, 100, 1),
              icon: Icon(Icons.content_paste_search_sharp, size: 17),
              title: Text('Enquiry'),
            ),
            FlashyTabBarItem(
              activeColor: Color.fromRGBO(8, 52, 142, 1),
              inactiveColor: Color.fromRGBO(100, 100, 100, 1),
              icon: Icon(CupertinoIcons.doc_on_clipboard_fill, size: 17),
              title: Text('Notes'),
            ),
          ],
        ),
      ),
    );
  }
}
