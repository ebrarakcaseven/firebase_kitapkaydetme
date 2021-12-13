import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseprojebaglantisi/home_page.dart';

class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //StorageService _storageService = StorageService();

  //veri gösterme

  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("kitap").snapshots();
    return ref;
  }
}
