import 'package:flutter/material.dart';

class Berita extends StatefulWidget {
  @override
  _BeritaState createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              width: double.infinity,
              child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn.getyourguide.com/img/tour_img-2037497-146.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Woyo woyo jos",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.calendar_today),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("22 Juni 1999"),
                                )
                              ],
                            ))
                      ])),
            );
          }),
    );
  }
}
