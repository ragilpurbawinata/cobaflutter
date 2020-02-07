import 'package:cobaflutterlagi/MenuHomeModel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MenuHomeModel> list() {
    return [
      MenuHomeModel("menuCoba", Icons.access_alarm),
      MenuHomeModel("menuCoba", Icons.access_alarm),
      MenuHomeModel("menuCoba", Icons.access_alarm),
      MenuHomeModel("menuCoba", Icons.access_alarm),
      MenuHomeModel("menuCoba", Icons.access_alarm),
      MenuHomeModel("menuAll", Icons.all_inclusive),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: <Widget>[dashboard(), menuUtama(), beritaUpdate()],
    );
  }

  Widget dashboard() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Overview",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 8, 8),
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(hexStringToHexInt("#9ccc65"))),
                    //color: Colors.yellowAccent,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.all_inclusive, color: Colors.white),
                          Text("07:45:46",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text("Tepat Waktu",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 16, 0, 8),
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(hexStringToHexInt("#26c6da"))),
                    //color: Colors.yellowAccent,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.all_inclusive, color: Colors.white),
                          Text("80 / 120",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text("Capaian / Jam Kerja",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(hexStringToHexInt("#ffca28"))),
                    //color: Colors.yellowAccent,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.all_inclusive, color: Colors.white),
                          Text("8",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text("Jatah Cuti",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(hexStringToHexInt("#ef5350"))),
                    //color: Colors.yellowAccent,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.all_inclusive, color: Colors.white),
                          Text("",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text("Presensi",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget menuUtama() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text("Menu Utama",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            children: list().map<Widget>((listx) {
              return InkWell(
                  onTap: () {
                    if (listx.nama == "menuAll") {
                      _showAllMenu(context);
                    }
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Card(
                    elevation: 1,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(listx.icon),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              listx.nama,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget beritaUpdate() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text("Berita & pengumuman",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Selengkapnya...",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue)),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.8,
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
                                      image: new DecorationImage(
                                          image: new NetworkImage(
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
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.calendar_today),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text("22 Juni 1999"),
                                      )
                                    ],
                                  ))
                            ])),
                  );
                }),
          )
        ],
      ),
    );
  }

  hexStringToHexInt(String hex) {
    hex = hex.replaceFirst('#', '');
    hex = hex.length == 6 ? 'ff' + hex : hex;
    int val = int.parse(hex, radix: 16);
    return val;
  }

  void _showAllMenu(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
//          return Container(
//            child: new Wrap(
//              children: <Widget>[
//                new ListTile(
//                    leading: new Icon(Icons.music_note),
//                    title: new Text('Music'),
//                    onTap: () => {}
//                ),
//                new ListTile(
//                  leading: new Icon(Icons.videocam),
//                  title: new Text('Video'),
//                  onTap: () => {},
//                ),
//              ],
//            ),
//          );
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              menuUtama(),
            ],
          );
        });
  }
}
