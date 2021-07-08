import 'package:MyTVGuide/models/series.dart';
import 'package:MyTVGuide/view_models/show_view_model.dart';
import 'package:MyTVGuide/views/episodes_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowDetailWidget extends StatelessWidget {
  const ShowDetailWidget({
    @required this.show,
  });

  final ShowClass show;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.02,
    );
    return Container(
      width: double.infinity,
      transform: Matrix4.translationValues(
          0.0, -MediaQuery.of(context).size.height * 0.08, 0.0),
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.024),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Text(
                show.name,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.grey),
              textData(
                textStyle,
                show.genres.length == 0 ? 'N/A' : show.genres.join(','),
              ),
              textData(textStyle, "Language: ${show.language}"),
              textData(textStyle, "Type: ${show.type}"),
              textData(textStyle, "Runtime: ${show.runtime}"),
              textData(textStyle, "Premiered date: ${show.premiered}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.yellow[700]),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  textData(textStyle, "${show.rating}"),
                ],
              ),
              textData(textStyle, "Network: ${show.network}"),
            ],
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Synopsis',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                show.summary.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' '),
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.5),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EpisodesList(id: show.id),
                      ),
                    );
                  },
                  color: Colors.red[800],
                  child: Text(
                    "Episodes",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Consumer<FavouriteShow>(
                builder: (context, favouriteShow, child) {
                  List favNames = [];
                  List ids = [];
                  Provider.of<FavouriteShow>(context, listen: false).getFavs();

                  List favs = favouriteShow.favourites;

                  // favs.map((fav) => favNames.add(fav["name"]));
                  for (ShowClass fav in favs) {
                    favNames.add(fav.name);
                    ids.add(fav.id);
                  }
                  // checking id is more reliable because of uniqueness as different shows may have same name
                  if (!ids.contains(show.id)) {
                    return ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: MaterialButton(
                        onPressed: () {
                          Provider.of<FavouriteShow>(context, listen: false)
                              .addFav(show);
                        },
                        color: Colors.red[800],
                        child: Text(
                          "Add to favourites +",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check, color: Colors.green),
                        Text(
                          ' Favourites',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Padding textData(TextStyle textStyle, String data) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      data,
      style: textStyle,
    ),
  );
}
