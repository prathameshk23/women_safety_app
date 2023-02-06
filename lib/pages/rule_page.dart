// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class RulePage extends StatefulWidget {
  const RulePage({super.key});

  @override
  State<RulePage> createState() => _RulePageState();
}

class _RulePageState extends State<RulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              "",
              style: TextStyle(
                // fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "1. ",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text("1. "),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text("1. "),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text("1. "),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text("1. "),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ))),
    );
  }
}
