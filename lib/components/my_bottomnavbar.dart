import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}


class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

 void _navigateBottomBar(int index){
  setState(() {
    _selectedIndex = index;
  });
 }

 final List<Widget> pages = [
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

  @override
  Widget build(BuildContext context) {
    return 
        Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:15.0, vertical: 20),
          child: GNav(
            
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 58, 58, 58),
            gap: 8,
            onTabChange: (index){
              print(index);
            },
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(icon: Icons.home,
              
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
            ]),
        ),
      );
   
  }
}
