import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnCokHastasiOlanUlkePaneli extends StatelessWidget {
  final List ulkeVerisi;

  const EnCokHastasiOlanUlkePaneli({Key key, this.ulkeVerisi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    ulkeVerisi[index]['countryInfo']['flag'],
                    height: 34,
                  ),
                ),
                Text(
                  ulkeVerisi[index]['country'],
                  style: GoogleFonts.inter(
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
                  width: 10,
                ),
                Text(
                  "Vefat Sayısı: ${ulkeVerisi[index]['deaths'].toString()}",
                  style: GoogleFonts.inter(
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
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
