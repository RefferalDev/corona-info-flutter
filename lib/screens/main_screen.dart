
import 'package:corona/data/app.dart';
import 'package:corona/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPage,
        children: pages.map((t) {
          Widget wg = t['page'];
          return wg;
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getNavBarItems(),
        currentIndex: _selectedPage,
        onTap: _selectPage,
        backgroundColor: AppStyle.getColor(ThemeColor.secondary),
        selectedItemColor: AppStyle.getColor(ThemeColor.primary),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  /// navbar items
  List<BottomNavigationBarItem> _getNavBarItems() {
    List<BottomNavigationBarItem> navBarItems = [];
    pages.forEach(
      (item) {
        navBarItems.add(
          BottomNavigationBarItem(
              icon: item['icon'], title: Text(item['title'])),
        );
      },
    );
    return navBarItems;
  }

  /// selected page
  void _selectPage(int page) {
    setState(() => _selectedPage = page);
  }
}
