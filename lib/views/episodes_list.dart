import 'package:MyTVGuide/models/episode.dart';
import 'package:MyTVGuide/widgets/episode_widget.dart';
import 'package:MyTVGuide/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EpisodesList extends StatelessWidget {
  final int id;

  EpisodesList({this.id});

  Future<dynamic> getEpisodes() async {
    try {
      http.Response response =
          await http.get("https://api.tvmaze.com/shows/$id/episodes");

      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = episodeFromJson(response.body);
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
        title: Text("Episodes"),
        backgroundColor: Colors.yellow[700],
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: getEpisodes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Episode> episodes = snapshot.data;

            return ListView.builder(
              itemCount: episodes.length,
              itemBuilder: (context, index) {
                return EpisodeWidget(episodes: episodes, index: index);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
