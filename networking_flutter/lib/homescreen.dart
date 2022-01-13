import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networking_flutter/controller/apicontroller.dart';
import 'package:networking_flutter/view/detail.dart';
import 'package:networking_flutter/model/git_api.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;
  late GithubApi githubApi;
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ApiController apiController = Get.put(ApiController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white)),
          height: 50,
          width: 300,
          child: TextField(
              controller: namecontroller,
              cursorColor: Colors.blue[800],
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintText: "Search",
                  hintStyle: GoogleFonts.lato(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onSubmitted: (namecontroller) async {
                setState(() {
                  loading = true;
                });
                githubApi = await apiController
                    .github_call(namecontroller)
                    .whenComplete(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (b) => Detail(githubApi: githubApi)));
                  setState(() {
                    loading = false;
                  });
                });
              }),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              child: SizedBox(child: Image.asset("assets/ibg.png")),
            ),
            Text("Let's get explore some github accounts",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 25)),
            const SizedBox(
              height: 20,
            ),
            loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
