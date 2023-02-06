// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:women_safty_app/pages/helpline_page.dart';
import 'package:women_safty_app/pages/maps_page.dart';
import 'package:women_safty_app/pages/rule_page.dart';
// import 'package:women_safty_app/pages/map_page.dart';

import 'add_contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer myAudioPlayer = AudioPlayer();
  late Source audioUrl = UrlSource(
      'http://codeskulptor-demos.commondatastorage.googleapis.com/pang/paza-moduless.mp3');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.white,
                size: 30,
              )),
        ],
        title: Text("Woman Sefety App"),
        backgroundColor: Colors.purple[900],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.purple[900],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Icon(
                                Icons.rule_rounded,
                                color: Colors.purple[900],
                                size: 100,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => RulePage())));
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.pink[50],
                                ),
                                child: Text(
                                  "See Rules",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.purple[900],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Icon(
                                Icons.help_center_outlined,
                                color: Colors.purple[900],
                                size: 100,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => HelpLine())));
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.pink[50],
                                ),
                                child: Text(
                                  "Help Line",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.purple[900],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Icon(
                                Icons.phone_android,
                                color: Colors.purple[900],
                                size: 100,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => AddContact())));
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.pink[50],
                                ),
                                child: Text(
                                  "Add Contact",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.purple[900],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Icon(
                                Icons.map_outlined,
                                color: Colors.purple[900],
                                size: 100,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => MapPage())));
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.pink[50],
                                ),
                                child: Text(
                                  "Maps",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
