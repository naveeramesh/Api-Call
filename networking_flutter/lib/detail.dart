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
      body: Container(
        child: Text(widget.githubApi.name,
            style: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
