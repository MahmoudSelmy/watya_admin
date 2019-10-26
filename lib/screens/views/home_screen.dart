import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watya_app/core/models/brand_model.dart';
import 'package:watya_app/core/models/product_model.dart';
import 'package:watya_app/core/viewmodels/brand_curd_model.dart';
import 'package:watya_app/core/viewmodels/products_curd_model.dart';
import 'package:watya_app/screens/widgets/brands_products_item.dart';
import 'package:watya_app/screens/widgets/product_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Brand> brands;

  @override
  Widget build(BuildContext context) {
    final brandProvider = BrandsCRUDModel();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addProduct');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(child: Text('Home')),
      ),
      body: buildBody(brandProvider),
    );
    ;
  }

  Container buildBody(BrandsCRUDModel brandProvider) {
    return Container(
      child: StreamBuilder(
          stream: brandProvider.fetchBrandsAsStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              brands = snapshot.data.documents
                  .map((doc) => Brand.fromMap(doc.data, doc.documentID))
                  .toList();
              return ListView.builder(
                itemCount: brands.length,
                itemBuilder: (buildContext, index) =>
                BrandHorizontalProductsList(brand: brands[index],),
              );
            } else {
              return Text('fetching');
            }
          }),
    );
  }
}