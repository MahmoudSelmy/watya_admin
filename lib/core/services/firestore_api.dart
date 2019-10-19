import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class FireStoreAPI{
  final Firestore _db = Firestore.instance;


  Future<QuerySnapshot> getDataCollection(String collectionPath) {
    CollectionReference ref =  _db.collection(collectionPath);
    return ref.getDocuments() ;
  }
  Stream<QuerySnapshot> streamDataCollection(String collectionPath) {
    CollectionReference ref =  _db.collection(collectionPath);
    return ref.snapshots() ;
  }
  Future<DocumentSnapshot> getDocumentById(String collectionPath, String id) {
    CollectionReference ref =  _db.collection(collectionPath);
    return ref.document(id).get();
  }
  Future<void> removeDocument(String collectionPath, String id){
    CollectionReference ref =  _db.collection(collectionPath);
    return ref.document(id).delete();
  }
  Future<DocumentReference> addDocument(String collectionPath, Map data) {
    CollectionReference ref =  _db.collection(collectionPath);
    return ref.add(data);
  }
  Future<void> updateDocument(String collectionPath, Map data , String id) {
    CollectionReference ref =  _db.collection(collectionPath);
    return ref.document(id).updateData(data) ;
  }


}