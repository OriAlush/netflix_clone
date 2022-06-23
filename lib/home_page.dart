// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  
  TextStyle appBarStyle = TextStyle(fontFamily: 'Avenir next',  fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400);
  TextStyle infoStyle = TextStyle(fontFamily: 'Avenir next',  fontSize: 10, color: Color.fromARGB(255, 125, 125, 125), fontWeight: FontWeight.w400);
  TextStyle playTextStyle = TextStyle(fontFamily: 'Avenir next',  fontSize: 15, color: Colors.black, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x191919),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('stranger_things.png'),
              ),
            ),
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
          )
        ]
      )
    );
  }
}