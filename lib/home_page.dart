import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid/home.dart';
import 'package:flutter_covid/sss_sayfasi.dart';
import 'package:flutter_covid/ulke_sayfasi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map dunyaVerisi;

  DunyaGeneliVeriGetir() async {
    http.Response response =
        await http.get("https://disease.sh/v3/covid-19/all");
    dunyaVerisi = jsonDecode(response.body);
  }

  List ulkeVerisi;

  UlkeVeriGetir() async {
    http.Response response =
        await http.get("https://disease.sh/v3/covid-19/countries?sort=cases");
    ulkeVerisi = jsonDecode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    DunyaGeneliVeriGetir();
    UlkeVeriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Covid-19",
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.teal,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.5, 2.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
            Text(
              " İstatistikleri",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.5, 2.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Home(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /*
            IconButton(
              icon: Icon(
                Icons.menu_open,
                color: const Color(0xff47455f),
              ),
              onPressed: () {},
            ),
             */
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.teal,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search_outlined,
                color: Colors.grey[800],
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UlkeSayfasi()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.question_answer_outlined,
                color: Colors.grey[800],
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SssSayfasi()));
              },
            ),
          ],
        ),
      ),
      /*
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home_outlined),
            title: new Text('Anasayfa'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search_outlined),
            title: new Text('Arama'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer_outlined),
            title: Text('SSS'),
          ),
        ],
      ),
      */
    );
  }
}

/*
class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return;
      },
      child: PageView(
        controller: _controller,
        children: [
          Home(),
          SssSayfasi(),
          //FootprintPage(),
        ],
      ),
    );
  }
}
*/
