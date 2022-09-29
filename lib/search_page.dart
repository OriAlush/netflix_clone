// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/resources.dart';

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x191919),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 78, 78, 78),
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        margin: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0.0),
        height: 30,
        width: MediaQuery.of(context).size.width - 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
          onPressed: () {
            showSearch(context: context, delegate: CostumeSearchDelegate());
          },
          child: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search', style: TextStyle(color:Color.fromARGB(255, 134, 134, 134)),),
                Icon(Icons.search, color: Color.fromARGB(255, 134, 134, 134),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CostumeSearchDelegate extends SearchDelegate {

  final List searchTerms = [
    'popular0',    
    'popular1',
    'popular2',
    'popular3',
    'popular4',
    'previews0',    
    'previews1',
    'previews2',
    'previews3',
    'previews4',
    ];

  @override
  ThemeData appBarTheme(BuildContext context) {
  final ThemeData theme = Theme.of(context);
  return theme.copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 78, 78, 78),
      iconTheme: theme.primaryIconTheme.copyWith(color: Color.fromARGB(255, 134, 134, 134)),
      foregroundColor: Color.fromARGB(255, 134, 134, 134),
    ),
    inputDecorationTheme: searchFieldDecorationTheme ??
        InputDecorationTheme(
          border: InputBorder.none,
        ),
  );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }  

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}