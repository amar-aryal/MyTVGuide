import 'package:MyTVGuide/views/favourite_shows.dart';
import 'package:MyTVGuide/views/shows_list.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _showController = TextEditingController();

  @override
  void dispose() {
    _showController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset("assets/television.png"),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  "Browse TV shows",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: TextField(
                    controller: _showController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.tv),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0)),
                      hintText: "Enter show name",
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowsList(
                            showname: _showController.text.trim(),
                          ),
                        ),
                      );
                    },
                    color: Color(0xff34bf38),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        Text(
                          "Search",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.03,
              left: MediaQuery.of(context).size.width * 0.75,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavouriteShows(),
                    ),
                  );
                },
                // color: Color(0xff34bf38),
                child: CircleAvatar(
                  backgroundColor: Colors.amber[400],
                  radius: MediaQuery.of(context).size.height * 0.03,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
