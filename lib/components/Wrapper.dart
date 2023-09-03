import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Pages/Profile.dart';
import 'my_bottomnavbar.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}



class _WrapperState extends State<Wrapper> {

  final List<Widget> pages = [
    profilePage(),
    Center(
      child: Container(
        height: 300,
      child: Text('12345')
      ),
    ),
    Center(
      child: Container(
        height: 300,
      child: Text('Hello')
      ),
    ),
    Center(
      child: Container(
        height: 300,
      child: Text('Hello')
      ),
    ),
 ];

 int _selectedIndex = 0;

 void _navigateBottomBar(int index){
  setState(() {
    _selectedIndex = index;
  });
 }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            
            Expanded(
              child: pages[_selectedIndex]),
            GNav(
              selectedIndex: _selectedIndex,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 58, 58, 58),
            gap: 8,
            onTabChange: (index){
             _navigateBottomBar (index);
            },
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(icon: Icons.home,
              //onPressed: _navigateBottomBar,
              text:('Home')
              ),
              GButton(icon: Icons.favorite,
              text:('Likes')
              ),
              GButton(icon: Icons.search,
              text:('Search')
              ),
              GButton(icon: Icons.settings,
              text:('Settings')
              ),
            ])
          ],
        ),
    )
  );
  }
}