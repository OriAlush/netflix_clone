// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:netflix_clone/home_page.dart';
import 'package:netflix_clone/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: NetflixBar(),
    );
  }
}

class NetflixBar extends StatelessWidget {
  const NetflixBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0x191919),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home_outlined), text: 'Home',),
              Tab(icon: Icon(Icons.search_outlined), text: 'Search',),
              Tab(icon: Icon(Icons.download_outlined), text:'Downloads',),
              Tab(icon: Icon(Icons.menu_outlined), text: 'Menu',),
            ],          
            unselectedLabelColor: Color.fromARGB(255, 125, 125, 125),
            labelColor: Colors.white,
            indicatorColor: Colors.transparent,         
          ),
        ),
        body: TabBarView(
          children: [
            HomePage(),
            SearchPage(),
            Center(child: Text('Page 3'),),
            Center(child: Text('Page 4'),),
          ],
        ),
      ),
    );
  }
}