import 'package:flutter/material.dart';


class Search extends SearchDelegate {


  
  @override
  String get searchFieldLabel => "Que deseas ? ";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  String selectedResult;
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }
  
final List<String> doomieList =
      List.generate(10, (index) => "This is my title/description $index");
      
  Search();
  List<String> recentList = ['Text 1', 'Text 2'];
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionsList = [];
    query.isEmpty
        ? suggestionsList = recentList
        : suggestionsList
            .addAll(doomieList.where((element) => element.contains(query)));

    return ListView.builder(
      shrinkWrap: true,
      itemCount: suggestionsList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionsList[index]),
        onTap: () {
          selectedResult = suggestionsList[index];
          showResults(context);
        },
      ),
    );
  }
}