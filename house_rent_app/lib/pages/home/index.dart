import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index.dart';
import 'package:hook_up_rent/pages/home/tab_info/index.dart';
import 'package:hook_up_rent/pages/home/tab_search/index.dart';
import 'package:hook_up_rent/pages/home/tab_profile/index.dart';

final List<Widget> _tableViewList = [
  TabIndex(),
  TabSearch(),
  TabInfo(),
  TabProfile()
];

final List<BottomNavigationBarItem> _items = [
  BottomNavigationBarItem(icon: Icon(Icons.home),label: '首页'),
  BottomNavigationBarItem(icon: Icon(Icons.search),label: '搜索'),
  BottomNavigationBarItem(icon: Icon(Icons.info),label: '资讯'),
  BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: '我的'),
];

class HomePage extends StatefulWidget {

   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_tableViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: _items,
        onTap: _onItemTapped,
        fixedColor: Colors.green,
      ),
    );
  }
}



