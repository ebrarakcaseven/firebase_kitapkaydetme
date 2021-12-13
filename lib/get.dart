import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseprojebaglantisi/main.dart';
import 'package:firebaseprojebaglantisi/home_page.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Kaydet extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference kitapRef = _firestore.collection("kitap");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6.0),
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "Kaydet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text("get data"),
                    onPressed: () async {
                      var response = await kitapRef.get();
                      var list = response.docs;
                      // ignore: avoid_print
                      print(list[1].data());
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
