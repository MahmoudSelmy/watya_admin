import 'dart:async';
import 'package:flutter/material.dart';
import 'package:watya_app/core/constants.dart';
import 'package:watya_app/core/services/firestore_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:watya_app/core/models/brand_model.dart';

class BrandsCRUDModel extends ChangeNotifier {
  FireStoreAPI _api = FireStoreAPI();
  List<Brand> brands;
  String fireStorePath = CONSTANTS.FIRE_STORE_BRANDS_COLLECTION_PATH;


  Future<List<Brand>> fetchBrands() async {
    var result = await _api.getDataCollection(fireStorePath);
    brands = result.documents
        .map((doc) => Brand.fromMap(doc.data, doc.documentID))
        .toList();
    return brands;
  }

  Stream<QuerySnapshot> fetchBrandsAsStream() {
    return _api.streamDataCollection(fireStorePath);
  }

  Future<Brand> getBrandById(String id) async {
    var doc = await _api.getDocumentById(fireStorePath, id);
    return  Brand.fromMap(doc.data, doc.documentID) ;
  }


  Future removeBrand(String id) async{
    await _api.removeDocument(fireStorePath, id) ;
    return ;
  }
  Future updateBrand(Brand data,String id) async{
    await _api.updateDocument(fireStorePath, data.toJson(), id) ;
    return ;
  }

  Future addBrand(Brand data) async{
    DocumentReference result  = await _api.addDocument(fireStorePath, data.toJson()) ;
    return ;

  }


}