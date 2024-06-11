import 'dart:convert';

import 'package:flutter_with_api/article.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  static var client = http.Client();
  static String baseUrl = "http://localhost:3000/api/article";
  static var header = {
    "Content-type": "application/json",
  };

  //Récupérer les infos avec la méthod http get
  static Future<List<dynamic>> getAll() async {
    var url = Uri.parse(baseUrl);
    try {
      var response = await client.get(url, headers: header);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Ajouter les infos avec la méthod http get
  static Future<dynamic> create(Article a) async {
    var url = Uri.parse(baseUrl);
    try {
      var response =
          await client.post(url, headers: header, body: jsonEncode(a.toJson()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create article ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

  //Modifier les infos avec la méthod http get
  static Future<dynamic> update(Article a) async {
    var url = Uri.parse(baseUrl);
    try {
      var response =
          await client.put(url, headers: header, body: jsonEncode(a.toJson()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to update article');
      }
    } catch (e) {
      throw Exception("Impossible de modifier les données");
    }
  }

  //Supprimer les infos avec la méthod http get
  static Future<void> delete(id) async {
    var url = Uri.parse("$baseUrl/$id");
    try {
      var response = await client.delete(url, headers: header);
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to delete article');
      }
    } catch (e) {
      throw Exception("Impossible de supprimer les données");
    }
  }
}
