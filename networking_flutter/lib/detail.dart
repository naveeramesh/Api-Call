import 'package:flutter/material.dart';
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
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(widget.githubApi.email,
            //     style: const TextStyle(
            //       color: Colors.white,
            //     )),
            Text(widget.githubApi.bio,
                style: const TextStyle(
                  color: Colors.white,
                )),
            Text(widget.githubApi.location,
                style: const TextStyle(
                  color: Colors.white,
                )),
            Text(widget.githubApi.name,
                style: const TextStyle(
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
