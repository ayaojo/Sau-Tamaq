import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFEFEFE),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFFEFEFE),
          actions: [
            IconButton(
              icon: const Icon(UniconsLine.search),
              onPressed: () {
                showSearch(context: context, delegate: MySearchBar());
              },
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30.0),
          //color:
          child: const Text(
            'Что ты хочешь приготовить сегодня?',
            maxLines: 2,
            style: TextStyle(
              color: Color(0xFF191919),
              fontWeight: FontWeight.bold,
              fontSize: 26,
              overflow: TextOverflow.ellipsis,
              letterSpacing: -0.04,
            ),
          ),
        ));
  }
}

class MySearchBar extends SearchDelegate {
  List<String> allData = ['dessert', 'Apple Pie', 'Chocolate Cake', 'Ramen'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(UniconsLine.x))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          UniconsLine.angle_left_b,
          color: Colors.black,
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
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
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
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
        });
  }
}
