import 'package:MyTVGuide/models/series.dart';
import 'package:MyTVGuide/views/show_detail.dart';
import 'package:flutter/material.dart';

class ShowWidget extends StatelessWidget {
  const ShowWidget({
    Key key,
    @required this.shows,
    @required this.index,
  }) : super(key: key);

  final List<Show> shows;
  final int index;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.018,
      color: Colors.grey,
    );
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.014),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.014),
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Image.network(
                  shows[index].show.image,
                )),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Flexible(
              child: Column(
                children: [
                  Text(
                    shows[index].show.name,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    shows[index].show.genres.length == 0
                        ? 'N/A'
                        : shows[index].show.genres.join(','),
                    style: textStyle,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // Text(
                  //   shows[index].show.summary == 'N/A'
                  //       ? shows[index].show.summary
                  //       : shows[index]
                  //               .show
                  //               .summary
                  //               .replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ')
                  //               .substring(0, 20) +
                  //           '....',
                  //   textAlign: TextAlign.justify,
                  // ),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShowDetail(show: shows[index].show),
                        ),
                      );
                    },
                    color: Colors.red[800],
                    child: Text(
                      "More info",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
