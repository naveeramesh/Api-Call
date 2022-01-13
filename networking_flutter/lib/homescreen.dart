import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networking_flutter/detail.dart';
import 'package:networking_flutter/model/git_api.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> names = [
    "naveeramesh",
    "msramesh2k1",
    "HarshCasper",
    "KamalSharma"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 100, top: 40),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.white),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Search",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 220),
                      child: Text("Let's explore some popular github account",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SizedBox(
                        height: 100,
                        width: 130,
                        child: Image.asset("assets/ibg.png")),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: names.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.grey[200]!)]),
                          height: 70,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(names[index],
                                    style: GoogleFonts.lato(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                IconButton(
                                    onPressed: () async {
                                      const endpointUrl =
                                          "https://api.github.com/users/msramesh2k1";
                                      http.Response response;
                                      response = await http
                                          .get(Uri.parse(endpointUrl));
                                      if (response.statusCode == 200) {
                                        final data = json.decode(response.body);
                                        final github = GithubApi.fromJson(data);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (b) => Detail(
                                                  githubApi: github,
                                                )));
                                      } else {
                                        throw ("Can't fecth API");
                                      }
                                    },
                                    icon: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 15))
                              ],
                            ),
                          )),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
