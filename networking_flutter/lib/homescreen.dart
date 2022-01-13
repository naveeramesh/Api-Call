import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      constraints: BoxConstraints(maxWidth: 220),
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
          ],
        ),
      ),
    );
  }
}
