import 'package:flutter/material.dart';
import 'package:watya_app/core/models/product_model.dart';
import 'package:watya_app/core/viewmodels/products_curd_model.dart';
import 'package:watya_app/screens/widgets/product_details.dart';
import 'package:watya_app/core/models/brand_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:watya_app/screens/widgets/product_card.dart';

class BrandHorizontalProductsList extends StatefulWidget
{
  final Brand brand;

  BrandHorizontalProductsList({@required this.brand});

  @override
  _BrandHorizontalProductsListState createState() => _BrandHorizontalProductsListState();
}

class _BrandHorizontalProductsListState extends State<BrandHorizontalProductsList>
{
  ProductsCRUDModel productProvider = ProductsCRUDModel();
  List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: buildBrandImage(),
          title: Text(widget.brand.name, style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
        ),
        Container(
          child: StreamBuilder(
              stream: productProvider.fetchBrandProductsAsStream(widget.brand.id),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  products = snapshot.data.documents
                      .map((doc) => Product.fromMap(doc.data, doc.documentID))
                      .toList();
                  return Container(
                    height: 300.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (buildContext, index) =>
                          ProductCard(productDetails: products[index]),
                    ),
                  );
                } else {
                  return Text('fetching');
                }
              }),
        ),
        Divider()
      ],
    );
  }

  CircleAvatar buildBrandImage() {
    return CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(widget.brand.image),
          backgroundColor: Colors.transparent,
        );
  }

}
