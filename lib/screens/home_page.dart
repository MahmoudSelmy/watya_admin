import 'package:flutter/material.dart';
import 'package:watya_app/core/models/brand_model.dart';
import 'package:watya_app/core/viewmodels/brand_curd_model.dart';
import 'package:watya_app/screens/widgets/brands_products_item.dart';
import 'package:watya_app/utils/dimensions_manager.dart';
import 'package:watya_app/screens/homepage/home_app_bar_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DimensionsManager _dimenManager = DimensionsManager();
  List<Brand> brands;
  @override
  Widget build(BuildContext context) {
    final brandProvider = BrandsCRUDModel();
    return Scaffold(
      appBar: HomeAppBar.build(context),
      body: buildBody(brandProvider),
    );
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
