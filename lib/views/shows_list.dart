import 'package:MyTVGuide/models/series.dart';
import 'package:MyTVGuide/widgets/show_widget.dart';
import 'package:MyTVGuide/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const showsListURL = "https://api.tvmaze.com/search/shows";

class ShowsList extends StatelessWidget {
  final String showname;
  ShowsList({this.showname});

  Future<dynamic> getShowsList() async {
    try {
      http.Response response = await http.get('$showsListURL?q=$showname');

      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = showFromJson(response.body);
        print(data);

        return data;
      } else {
        toastMsg("Error");
      }
    } catch (e) {
      toastMsg(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        title: Text("Shows list"),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Search results for '$showname'",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: MediaQuery.of(context).size.height * 0.03),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getShowsList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Show> shows = snapshot.data;

                  return ListView.builder(
                    itemCount: shows.length,
                    itemBuilder: (context, index) {
                      return ShowWidget(shows: shows, index: index);
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
