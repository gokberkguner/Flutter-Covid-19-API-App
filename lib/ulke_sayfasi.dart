import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_covid/home_page.dart';
import 'package:flutter_covid/search.dart';
import 'package:flutter_covid/sss_sayfasi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class UlkeSayfasi extends StatefulWidget {
  @override
  _UlkeSayfasiState createState() => _UlkeSayfasiState();
}

class _UlkeSayfasiState extends State<UlkeSayfasi> {
  List ulkeVerisi;

  UlkeVeriGetir() async {
    http.Response response =
        await http.get("https://disease.sh/v3/covid-19/countries?sort=cases");
    ulkeVerisi = jsonDecode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UlkeVeriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.search_outlined),
                onPressed: () {
                  showSearch(context: context, delegate: Search(ulkeVerisi));
                })
          ],
          title: Text(
            "Ülke İstatislikleri",
            style: GoogleFonts.inter(
              fontSize: 22,
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
          ),
        ),
        body: ulkeVerisi == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black26,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 130,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ulkeVerisi[index]["country"],
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
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.network(
                                    ulkeVerisi[index]["countryInfo"]["flag"],
                                    height: 40,
                                    width: 50,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Vaka Sayısı: " +
                                      ulkeVerisi[index]["cases"].toString(),
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.red[300],
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
                                  "Aktif Hasta Sayısı: " +
                                      ulkeVerisi[index]["active"].toString(),
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.blue[300],
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
                                  "İyileşen Sayısı: " +
                                      ulkeVerisi[index]["recovered"].toString(),
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.green[300],
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
                                  "Vefat Sayısı: " +
                                      ulkeVerisi[index]["deaths"].toString(),
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.5, 2.0),
                                        blurRadius: 3.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  );
                },
                itemCount: ulkeVerisi == null ? 0 : ulkeVerisi.length,
              ),
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
                  color: Colors.grey[800],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.teal,
                ),
                onPressed: () {},
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
        ));
  }
}
