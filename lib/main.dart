import 'package:cobaflutterlagi/Berita.dart';
import 'package:cobaflutterlagi/Home.dart';
import 'package:cobaflutterlagi/Notifikasi.dart';
import 'package:cobaflutterlagi/Profil.dart';
import 'package:cobaflutterlagi/Splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(Splash());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool imageShow = true;
  String appTitle = "Hello John";
  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Beranda')
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.search),
        title: new Text('Berita'),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          title: Text('Notifikasi')
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          title: Text('Profil')
      )
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      physics: new NeverScrollableScrollPhysics(),
      children: <Widget>[
        Home(),
        Berita(),
        Notifikasi(),
        Profil(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.jumpToPage(bottomSelectedIndex);
      //pageController.animateToPage(bottomSelectedIndex, duration: Duration(milliseconds: 1000), curve: Curves.ease);

      switch(bottomSelectedIndex){
        case 0 : {appTitle = "Hello John";imageShow = true;break;}
        case 1 : {appTitle = "Berita";imageShow = false;break;}
        case 2 : {appTitle = "Notifikasi";imageShow = false;break;}
        case 3 : {appTitle = "Profil";imageShow = false;break;}
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility (
              visible: imageShow,
              child: Container(
                  width: 30,
                  height: 30,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Alan_Walker.jpg/300px-Alan_Walker.jpg")
                      )
                  )),
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text(appTitle))
          ],
        ),
      ),
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
