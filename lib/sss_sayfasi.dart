import 'package:flutter/material.dart';
import 'package:flutter_covid/data.dart';
import 'package:flutter_covid/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SssSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S.S.S",
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
            )),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              Data.sikcaSorulanSorularVeCevaplari[index]["soru"],
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
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  Data.sikcaSorulanSorularVeCevaplari[index]["cevap"],
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
              )
            ],
          );
        },
        itemCount: Data.sikcaSorulanSorularVeCevaplari.length,
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
                color: Colors.grey[800],
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.question_answer_outlined,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
