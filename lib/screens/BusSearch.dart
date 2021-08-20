import 'package:flutter/material.dart';
import 'DTable.dart';

class BusSearch extends SearchDelegate<String> {
  final buses = [
    "srabon",
    "Khonika",
    "Boishakhi",
    "Choitali",
    "Falguni",
    "Hemonto",
    "IshaKha",
    "Kinchit",
    "Bosonto",
    "Moitree",
    "Torongo",
    "Ullash"
  ];
  final recentSearches = ["Srabon", "Khonika", "Boishakhi", "Choitali"];
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for appbar
    return [IconButton(icon: Icon(Icons.search), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the appbar
    return new IconButton(
      icon: new Icon(Icons.close),
      onPressed: () => Navigator.of(context).pop(null),
    );
    /*IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.arrow_menu, progress: transitionAnimation),
        onPressed: () {
        });*/
  }

  @override
  Widget buildResults(BuildContext context) {
    // show result based on the selection
    //return DTable().build(context);
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show sugestion
    final sugessionList = query.isEmpty
        ? recentSearches
        : buses.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          //showResults(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext) => new DTable(busName: sugessionList[index])),
          );
        },
        leading: Icon(Icons.directions_bus),
        title: RichText(
          text: TextSpan(
              text: sugessionList[index].substring(0, query.length),
              style:
              TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: sugessionList[index].substring(query.length),
                  style:
                  TextStyle(color: Colors.grey),
                )
              ]
          ),
        ),
      ),
      itemCount: sugessionList.length,
    );
  }
}