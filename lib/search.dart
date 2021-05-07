import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends SearchDelegate {
  final List ulkelerListesi;

  Search(this.ulkelerListesi);

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear_outlined),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(Icons.arrow_back_outlined),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    final oneriList = query.isEmpty
        ? ulkelerListesi
        : ulkelerListesi
            .where((element) =>
                element["country"].toString().toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemCount: oneriList.length,
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
                          oneriList[index]["country"],
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
                          oneriList[index]["countryInfo"]["flag"],
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
                        "Vaka Sayısı: " + oneriList[index]["cases"].toString(),
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
                            oneriList[index]["active"].toString(),
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
                            oneriList[index]["recovered"].toString(),
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
                            oneriList[index]["deaths"].toString(),
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
    );
  }
}
