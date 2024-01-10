import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchListScreen extends StatefulWidget {
  @override
  WatchListScreenState createState() => WatchListScreenState();
}

class WatchListScreenState extends State<WatchListScreen> {
  late List<String> watchList;

  WatchListScreenState() {
    // Move the logic to load the watch list to the constructor
    loadWatchList();
  }

  Future<void> loadWatchList() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      watchList = prefs.getStringList('watchList') ?? [];
    });
  }

  Future<void> saveWatchList() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('watchList', watchList);
  }

  void addToWatchList(String movieTitle) {
    setState(() {
      if (!watchList.contains(movieTitle)) {
        watchList.add(movieTitle);
        saveWatchList();
      }
    });
  }

  void removeFromWatchList(String movieTitle) {
    setState(() {
      watchList.remove(movieTitle);
      saveWatchList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch List'),
      ),
      body: ListView.builder(
        itemCount: watchList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(watchList[index]),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                removeFromWatchList(watchList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
