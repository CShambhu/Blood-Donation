import 'dart:math';

import 'package:blood_donation/check_request.dart';
import 'package:blood_donation/home.dart';
import 'package:blood_donation/login.dart';
import 'package:blood_donation/profile.dart';
import 'package:blood_donation/registration.dart';
import 'package:blood_donation/request_blood.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: CheckRequest(),
    );
  }
}
