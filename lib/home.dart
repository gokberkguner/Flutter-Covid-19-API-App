import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_covid/data.dart';
import 'package:flutter_covid/dunya_geneli_paneli.dart';
import 'package:flutter_covid/en_cok_hastasi_olan_ulkeler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.teal,
            ),
            height: 40,
            child: Text(
              Data.onSoz,
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 8, left: 8),
                  child: Text(
                    "Dünya Geneli",
                    style: GoogleFonts.inter(
                      fontSize: 24,
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
                /*
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UlkeSayfasi()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black38),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Bölgesel",
                          style: GoogleFonts.inter(
                            fontSize: 12,
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
                    ),
                  ),
                ),
                */
              ],
            ),
          ),
          Divider(
            thickness: 4,
            endIndent: 16,
            indent: 16,
          ),
          dunyaVerisi == null
              ? Center(child: CircularProgressIndicator())
              : DunyaGeneliPaneli(
                  dunyaVerisi: dunyaVerisi,
                ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Text(
              "En Çok Etkilenen Ülkeler",
              style: GoogleFonts.inter(
                fontSize: 24,
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
          Divider(
            thickness: 4,
            endIndent: 16,
            indent: 16,
          ),
          ulkeVerisi == null
              ? Center(child: CircularProgressIndicator())
              : EnCokHastasiOlanUlkePaneli(
                  ulkeVerisi: ulkeVerisi,
                ),
        ],
      ),
    );
  }
}
