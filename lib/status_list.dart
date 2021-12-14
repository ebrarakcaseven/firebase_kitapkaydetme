import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseprojebaglantisi/home_page.dart';
import 'package:firebaseprojebaglantisi/status_service.dart';
import 'package:flutter/material.dart';

class StatusListPage extends StatefulWidget {
  const StatusListPage({Key? key}) : super(key: key);

  @override
  _StatusListPageState createState() => _StatusListPageState();
}

class _StatusListPageState extends State<StatusListPage> {
  StatusService _statusService = StatusService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 0, left: 5.0),
          child: RawMaterialButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            elevation: 2.0,
            fillColor: Colors.blueGrey,
            child: const Icon(Icons.keyboard_arrow_left),
            padding: const EdgeInsets.all(5.0),
            shape: const CircleBorder(),
          ),
        ),
        title: Text(
          "KİTAPLAR",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
            // backgroundColor: Colors.green,
            fontSize: 22,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _statusService.getStatus(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text(
                'No Data...',
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot mypost = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("${mypost['name']}",
                                    style: TextStyle(fontSize: 25)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
