import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_textfield.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  //text controller
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  //dispose
  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  final user = FirebaseAuth.instance.currentUser!;

  Future addUserDetails(
    String name,
    String number,
  ) async {
    await FirebaseFirestore.instance.collection(user.email!).add({
      'Name': name,
      'Number': number,
    });
  }

  Future addDetail() async {
    addUserDetails(
      _nameController.text.trim(),
      _numberController.text.trim(),
    );

    Navigator.pop(
        context, MaterialPageRoute(builder: ((context) => const AddContact())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                // logo
                Icon(
                  Icons.contact_phone,
                  color: Colors.purple[900],
                  size: 100,
                ),

                const SizedBox(height: 10),

                // text
                // ignore: prefer_const_constructors
                Text(
                  'Add Emergency Contact',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // First Name textfield
                // ignore: prefer_const_constructors
                MyTextField(
                  controller: _nameController,
                  hintText: 'Name',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // Middle Name textfield
                // ignore: prefer_const_constructors
                MyTextField(
                  controller: _numberController,
                  hintText: 'Number',
                  obscureText: false,
                ),

                const SizedBox(height: 25),

                // sign in button
                GestureDetector(
                  onTap: addDetail,
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.purple[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Add Contact",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // not a member? register now
              ],
            ),
          ),
        ),
      ),
    );
  }
}
