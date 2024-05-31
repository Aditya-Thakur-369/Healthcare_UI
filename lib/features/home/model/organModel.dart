// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OrganModel {
  String name;
  String imageUrl;
  List<ListModel> conditions;
  OrganModel({
    required this.name,
    required this.imageUrl,
    required this.conditions,
  });
}

class ListModel {
  IconData icon;
  String name;
  String value;
  ListModel({
    required this.icon,
    required this.name,
    required this.value,
  });
}
