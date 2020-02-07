import 'package:cobaflutterlagi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'CirclePageIndicator.dart';

class Intro extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
    );
  }
}

class IntroPage extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<IntroPage> {
  final listImg = [
    "images/ic_intro_slide_1.png",
    "images/ic_intro_slide_2.png",
    "images/ic_intro_slide_3.png",
    "images/ic_intro_slide_4.png"
  ];

  final listTx1 = [
    "Kenali Lebih Dekat Rekan Kerja Anda",
    "Ajukan Ijin dan Cuti Anda Tanpa Repot",
    "Pesan Ruang Untuk Rapat Dimanapun dan Kapanpun",
    "Monitor Performa Anda Melalui Data Presensi"
  ];

  final listTx2 = [
    "Berikan selamat di hari ulang tahunya, ucapkan selamat datang kepada karyawan baru",
    "Ajukan ijin dan cuti anda tanpa repot menulis form, dengan eSIKAP pengajuan bisa dilakukan dengan mudah ",
    "Pesan Ruangan untuk kebutuhan Rapat dengan mudah melalui eSIKAP",
    "Seberapa rajinkah anda, berapa presentase kehadiran anda di kantor, semua termonitor di dalan eSIKAP"
  ];

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  String btNext = "Selanjutnya";

  @override
  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        _buildPageView(),
//        _buildCircleIndicator(),
//      ],
//    );
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildPageView(),
          _buildCircleIndicator(),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 20.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => MyApp()));
                          },
                          child: Container(
                            height: 48,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(hexStringToHexInt("#707070")),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Lewati",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )),
                    Spacer(),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            if(_currentPageNotifier.value<listImg.length-1){
                              setState(() {
                                btNext = "Selanjutnya";
                                _currentPageNotifier.value = _currentPageNotifier.value+1;
                                _pageController.animateToPage(_currentPageNotifier.value, duration: Duration(milliseconds: 1000), curve: Curves.ease);
                              });
                            }
                            else{
                              setState(() {
                                btNext = "Mulai";
                              });
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => MyApp()));
                            }
                          },
                          child: Container(
                            height: 48,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(hexStringToHexInt("#42a5f5")),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                btNext,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return Container(
      color: Colors.white,
      height: double.infinity,
      child: PageView.builder(
          itemCount: listImg.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return slideIntro(listImg[index], listTx1[index], listTx2[index]);
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
            if(_currentPageNotifier.value<listImg.length-1){
              setState(() {
                btNext = "Selanjutnya";
              });
            }
            else{
              setState(() {
                btNext = "Mulai";
              });
            }
          }),
    );
  }

  Widget _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 100.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: listImg.length,
          currentPageNotifier: _currentPageNotifier,
          dotColor: Color(hexStringToHexInt("#707070")),
          selectedDotColor: Color(hexStringToHexInt("#42a5f5")),
        ),
      ),
    );
  }

  Widget slideIntro(String img, String tx1, String tx2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 50),
          width: double.infinity,
          height: 300,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  fit: BoxFit.fill, image: new AssetImage(img))),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            tx1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(tx2,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          ),
        ),
      ],
    );
  }
}

hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return val;
}

Widget _customButton() {
  return Material(
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      splashColor: Colors.blue,
      highlightColor: Colors.blue,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(""),
        ),
      ),
    ),
  );
}
