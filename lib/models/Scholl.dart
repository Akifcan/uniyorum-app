import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uni/constants/api_constants.dart';

class Scholl extends ChangeNotifier {
  final String id;
  final int totalPoint;
  final String name;
  final String phone;
  final String website;
  final String rector;
  final String email;
  final String address;
  final String province;

  Scholl(
      {this.id,
      this.totalPoint,
      this.name,
      this.phone,
      this.website,
      this.rector,
      this.email,
      this.address,
      this.province});

  List<Scholl> scholls = [];
  List<Scholl> mostPointScholl = [];

  factory Scholl.fromJson(Map json) {
    return Scholl(
        name: json['name'],
        totalPoint: json['totalPoint'],
        phone: json['phone'],
        website: json['website'],
        rector: json['rector'],
        id: json['_id'],
        province: json['province'],
        address: json['address'],
        email: json['email']);
  }

  getScholls() async {
    var response = await http.get(API_URL);
    List data = jsonDecode(response.body);
    scholls = data.map((scholl) => Scholl.fromJson(scholl)).toList();
    notifyListeners();
  }

  mostPoints() async {
    var response = await http.get('$API_URL/5/?sort=desc');
    List data = jsonDecode(response.body);
    mostPointScholl = data.map((scholl) => Scholl.fromJson(scholl)).toList();
    notifyListeners();
  }

  searchScholl(String val) async {
    var response = await http.get('$API_URL/search/$val');
    List data = jsonDecode(response.body);
    scholls = data.map((scholl) => Scholl.fromJson(scholl)).toList();
    notifyListeners();
  }
}
