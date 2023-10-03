import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/articals_model.dart';
import 'package:news_app/shared_component/constants/constants.dart';

import '../../model/source_model.dart';

class ApiManager {
  static Future<SourceModel> fetchSources(String category) async {
    var query = {
      "apiKey": Constants.apikey,
      "category": category,
    };
    final response = await http.get(
      Uri.https(
        Constants.baseURL,
        "v2/top-headlines/sources",
        query,
      ),
    );
    var sourceDate = SourceModel.fromJson(jsonDecode(response.body));

    debugPrint(response.body);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      debugPrint("error....");
      return SourceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load sources");
    }
  }

  static Future<ArticalsModel> fetchNewsList(String source) async {
    var query = {
      "apiKey": Constants.apikey,
      "sources": source,
    };
    var uri = Uri.https(
      Constants.baseURL,
      "/v2/everything",
      query,
    );

    final response = await http.get(uri);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      var articls = ArticalsModel.fromJson(jsonDecode(response.body));
      return articls;
    } else {
      throw Exception("Failed to load articls");
    }
  }
}
