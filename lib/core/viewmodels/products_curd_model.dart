import 'dart:async';
import 'package:flutter/material.dart';
import 'package:watya_app/core/constants.dart';
import 'package:watya_app/core/models/product_model.dart';
import 'package:watya_app/core/services/firestore_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsCRUDModel extends ChangeNotifier {
  FireStoreAPI _api = FireStoreAPI();
  List<Product> products;
  String fireStorePath = CONSTANTS.FIRE_STORE_PRODUCTS_COLLECTION_PATH;


  Future<List<Product>> fetchProducts() async {
    var result = await _api.getDataCollection(fireStorePath);
    products = result.documents
        .map((doc) => Product.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection(fireStorePath);
  }

  Stream<QuerySnapshot> fetchBrandProductsAsStream(String brandId) {
    return _api.streamEqualConditionDataCollection(fireStorePath, 'brandId', brandId);
    // return _api.streamDataCollection(fireStorePath);
  }

  Future<Product> getProductById(String id) async {
    var doc = await _api.getDocumentById(fireStorePath, id);
    return  Product.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
    await _api.removeDocument(fireStorePath, id) ;
    return ;
  }
  Future updateProduct(Product data,String id) async{
    await _api.updateDocument(fireStorePath, data.toJson(), id) ;
    return ;
  }

  Future addProduct(Product data) async{
    var result  = await _api.addDocument(fireStorePath, data.toJson()) ;

    return ;

  }


}