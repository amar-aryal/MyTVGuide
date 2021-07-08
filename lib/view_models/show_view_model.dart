import 'package:MyTVGuide/models/series.dart';
import 'package:MyTVGuide/widgets/toast.dart';
import 'package:flutter/cupertino.dart';

import 'db_helper.dart';

class FavouriteShow extends ChangeNotifier {
  List<ShowClass> _favourites = [];

  List<ShowClass> get favourites => [..._favourites];

  int get favLength => _favourites.length;

  Future addFav(ShowClass show) async {
    var db = DatabaseHelper();
    await db.saveFav(show).then((_) {
      _favourites.add(show);
      toastMsg("Added to favourites");
    });
    notifyListeners();
  }

  Future removeFav(ShowClass show) async {
    var db = DatabaseHelper();
    await db.deleteFav(show.id).then((_) {
      _favourites.remove(show);
      toastMsg("Removed from favourites");
    });
    notifyListeners();
  }

  getFavs() async {
    var db = new DatabaseHelper();
    List favs = await db.getAllFavs();
    print(favs);
    /*since _favourites data type is List<ShowClass> and favs return List<Map> from database data, so we
    again create a new ShowClass object and assign those data to the object's properties so that we can add the DB data to 
    _favourites list */

    // fav["genres"].replaceAll('"', '');

    favs.forEach((fav) => _favourites.add(
          ShowClass(
              id: fav["id"],
              name: fav["name"],
              // genres:
              //     (json.decode(fav["genres"]) as List<dynamic>).cast<String>(),
              rating: fav["rating"],
              image: fav["imageUrl"]),
        ));

    notifyListeners();
  }

  clearList() {
    _favourites.clear();
    notifyListeners();
  }

  resetList() {
    _favourites = [];
  }
}
