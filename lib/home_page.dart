// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone/resources.dart';

class HomePage extends StatelessWidget {

  final List _popular = [
    'popular0',    
    'popular1',
    'popular2',
    'popular3',
    'popular4',
    ]; 

  final List _previews = [
    'previews0',    
    'previews1',
    'previews2',
    'previews3',
    'previews4',
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x191919),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
            child: Expanded(
              flex: 2,
              child: Image(
                image: AssetImage('netflix_logo.png'), 
                width: 42,
                ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [                
                TextButton(
                  onPressed: () {}, 
                  child: Text('TV Shows', style: appBarStyle,)
                  ),
                TextButton(
                  onPressed: () {}, 
                  child: Text('Movies', style: appBarStyle,)),
                TextButton(
                  onPressed: () {}, 
                  child: Text('My List', style: appBarStyle,)),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(top: 0),
            children: [
              MainShow(),
              CategoryBlock(category: 'popular', amount: _popular.length,),
              CategoryBlock(category: 'previews', amount: _previews.length,),
            ],
          )
        ],
      )
    );
  }
}

class CategoryBlock extends StatelessWidget {
  final int amount;
  final String category;

  CategoryBlock({required this.category, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 198,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5.0, top: 15.0, bottom: 3.0),
            alignment: Alignment.centerLeft,
            height: 20, 
            child: Text(category, style: showStyle,)),
          Container(
            color: Colors.transparent,
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: amount,
              itemBuilder: (context, index) {
                return ShowsListBlock(show: category + index.toString());
              },
            ),
          )
        ],
      ),
    );
  }
}

class ShowsListBlock extends StatelessWidget {
  final String show;

  ShowsListBlock({required this.show});

  @override
  Widget build(BuildContext context) {
    return Container(      
      margin: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 3.0),
      height: 180,
      width: 115,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11), // Image border
        child: SizedBox.fromSize(
          size: Size.fromRadius(48), // Image radius
          child: Image.asset('$show.jpg'),
        ),
      ),
    );
  }
}


class MainShow extends StatelessWidget {
  const MainShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('stranger_things.png'),
        SizedBox(      
          height: 600,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 45,                  
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.transparent),
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text('My List', style: infoStyle),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.play_arrow, color: Colors.black,),
                          Text('Play', style: playTextStyle,),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.transparent),
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline),
                          Text('Info', style: infoStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ], 
    );
  }
}

