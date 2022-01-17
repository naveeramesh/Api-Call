import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networking_flutter/model/git_api.dart';

class Detail extends StatefulWidget {
  final GithubApi githubApi;
  const Detail({Key? key, required this.githubApi}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 18,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.githubApi.name,
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 30),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(widget.githubApi.avatarUrl),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 1.7),
                    child: Column(
                      children: [
                        Text(
                          widget.githubApi.bio,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Followers",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  widget.githubApi.followers.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Following ",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  widget.githubApi.following.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white12),
            child: Column(
              children: [
                ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20),
                      child: Text("Location",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 18)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 8),
                      child: Text(
                        widget.githubApi.location,
                        style:
                            GoogleFonts.lato(color: Colors.grey, fontSize: 14),
                      ),
                    )),
                ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20),
                      child: Text("Company",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 18)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 8),
                      child: Text(
                        widget.githubApi.company ?? "No works mentioned currently",
                        style:
                            GoogleFonts.lato(color: Colors.grey, fontSize: 14),
                      ),
                    )),
                ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20),
                      child: Text("Twitter",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 18)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 8),
                      child: Text(
                        widget.githubApi.twitterUsername,
                        style:
                            GoogleFonts.lato(color: Colors.grey, fontSize: 14),
                      ),
                    )),
                ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20),
                      child: Text("Blog",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 18)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 8),
                      child: Text(
                        widget.githubApi.blog ,
                        style:
                            GoogleFonts.lato(color: Colors.grey, fontSize: 14),
                      ),
                    )),
                ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20),
                      child: Text("Organisation",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 18)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 8),
                      child: Text(
                        widget.githubApi.organizationsUrl,
                        style:
                            GoogleFonts.lato(color: Colors.grey, fontSize: 14),
                      ),
                    )),
                ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20),
                      child: Text("Repos",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 18)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 8),
                      child: Text(
                        widget.githubApi.reposUrl,
                        style:
                            GoogleFonts.lato(color: Colors.grey, fontSize: 14),
                      ),
                    )),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
