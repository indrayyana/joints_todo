import 'package:flutter/material.dart';

AppBar appbar() {
  return AppBar(
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    title: const Text(
      "JOINTS Todo",
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
    elevation: 0,
  );
}
