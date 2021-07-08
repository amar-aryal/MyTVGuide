import 'package:MyTVGuide/view_models/show_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteShows extends StatefulWidget {
  @override
  _FavouriteShowsState createState() => _FavouriteShowsState();
}

class _FavouriteShowsState extends State<FavouriteShows> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavouriteShow>(context, listen: false)
        .resetList(); //calling this because the build method was called twice so it is a counter-measure

    Provider.of<FavouriteShow>(context, listen: false).getFavs();
    print(Provider.of<FavouriteShow>(context, listen: false).favourites);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
        backgroundColor: Colors.yellow[800],
        elevation: 0.0,
      ),
      body: Consumer<FavouriteShow>(
        builder: (context, favouriteShow, child) {
          if (favouriteShow.favourites != null) {
            if (favouriteShow.favLength == 0) {
              return Center(child: Text("Empty list"));
            }
            return ListView.builder(
              itemCount:
                  Provider.of<FavouriteShow>(context, listen: false).favLength,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.024),
                  margin: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.024),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Image.network(
                          favouriteShow.favourites[index].image,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              favouriteShow.favourites[index].name,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(color: Colors.grey),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow[700]),
                                Text(favouriteShow.favourites[index].rating),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          Provider.of<FavouriteShow>(context, listen: false)
                              .removeFav(favouriteShow.favourites[index]);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Text("Empty");
          }
        },
      ),
    );
  }
}
