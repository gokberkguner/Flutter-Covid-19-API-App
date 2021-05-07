import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DunyaGeneliPaneli extends StatelessWidget {
  final Map dunyaVerisi;

  const DunyaGeneliPaneli({Key key, this.dunyaVerisi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5,
        children: [
          DurumPaneli(
            baslik: "Vaka Sayısı",
            borderColor: Colors.teal,
            textColor: Colors.red[200],
            sayi: dunyaVerisi["cases"].toString(),
          ),
          DurumPaneli(
            baslik: "Aktif Hasta Sayısı",
            borderColor: Colors.teal,
            textColor: Colors.blue[200],
            sayi: dunyaVerisi["active"].toString(),
          ),
          DurumPaneli(
            baslik: "İyileşen Sayısı",
            borderColor: Colors.teal,
            textColor: Colors.green[200],
            sayi: dunyaVerisi["recovered"].toString(),
          ),
          DurumPaneli(
            baslik: "Vefat Sayısı",
            borderColor: Colors.teal,
            textColor: Colors.grey,
            sayi: dunyaVerisi["deaths"].toString(),
          ),
        ],
      ),
    );
  }
}

class DurumPaneli extends StatelessWidget {
  final Color borderColor;
  final Color textColor;
  final String baslik;
  final String sayi;

  const DurumPaneli(
      {Key key, this.borderColor, this.textColor, this.baslik, this.sayi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 60,
        width: 173,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          /*
          border: Border.all(
            width: 2,
            color: borderColor,
          ),
          */
          borderRadius: BorderRadius.circular(5),
          color: Colors.black26,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              baslik,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: textColor,
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
              height: 5,
            ),
            Text(
              sayi,
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
          ],
        ),
      ),
    );
  }
}

/*

 */
