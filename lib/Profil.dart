import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          "https://cdn.getyourguide.com/img/tour_img-2037497-146.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: new NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Alan_Walker.jpg/300px-Alan_Walker.jpg")
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text("Parkchuyong", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("Pro Player", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("Pro Player", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  )],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                          child: Text("Lokasi Kerja", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8),
                        child: Text("Lokasi Kerja"),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                          child: Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text("Email"),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16, top: 8),
                          child: Text("Telepon", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16, top: 8),
                        child: Text("Telepon"),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
