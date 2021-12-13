import 'package:firebaseprojebaglantisi/status_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text("Kitap"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: myController,
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                    onPressed: () {
                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      CollectionReference kitapRef =
                          FirebaseFirestore.instance.collection('kitap');
                      kitapRef.add({'name': myController.text});
                    },
                    child: Text(
                      "   kaydet   ",
                      style:
                          TextStyle(fontSize: 23, backgroundColor: Colors.grey),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StatusListPage()));
                    },
                    child: Text(
                      "   kitaplar   ",
                      style:
                          TextStyle(fontSize: 23, backgroundColor: Colors.grey),
                    )),
              )
            ])
          ]

              /* floatingActionButton: FloatingActionButton(
          child: const Text("kaydet"),
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            FirebaseFirestore firestore = FirebaseFirestore.instance;
            CollectionReference kitapRef =
                FirebaseFirestore.instance.collection('name');
            kitapRef.add({'name': myController.text});
          },
        ),*/
              ),
        ),
      ),
    );
  }
}
