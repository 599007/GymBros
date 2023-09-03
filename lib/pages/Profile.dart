import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertest/components/Tabs/private_posts.dart';
import 'package:fluttertest/components/Tabs/feed_view.dart';
import 'package:fluttertest/components/Tabs/lists_view.dart';
import 'package:fluttertest/components/my_drawer.dart';
import 'package:fluttertest/components/my_bottomnavbar.dart';
import "package:google_nav_bar/google_nav_bar.dart";

import '../components/Wrapper.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  void name(params) {}
  final List<Widget> tabs = const [
    Tab(
      icon: Icon(Icons.home, color: Colors.black),
    ),
    Tab(
      icon: Icon(Icons.list, color: Colors.black),
    ),
    Tab(
      icon: Icon(Icons.lock, color: Colors.black),
    )
  ];

  final List<Widget> tabBarViews = const [
    FeedView(),
    ListsView(),
    PrivateView(),
  ];

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          
            backgroundColor: Colors.grey[300],
            body: Column(
              children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '2319',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('Followers'),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black12,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2319',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('Following'),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Espen Strøm Grebstad',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Dataingeniør student ved HVL i Bergen',
                style: TextStyle(color: Colors.black45),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                'Follow',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))),
                    const SizedBox(width: 20),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            )))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TabBar(tabs: tabs),
              Expanded(child: TabBarView(children: tabBarViews)),
              
            ])));
  }
}
