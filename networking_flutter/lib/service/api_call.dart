import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:networking_flutter/model/git_api.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<GithubApi> github_call(String name) async {
    print(name);
    String endpointUrl = "https://api.github.com/users/$name";
    http.Response response;
    response = await http.get(Uri.parse(endpointUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final github = GithubApi.fromJson(data);

      return github;
    } else {
      throw ("Can't fecth API");
    }
  }
}
