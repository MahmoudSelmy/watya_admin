import 'package:flutter/material.dart';
import 'package:watya_app/core/models/product_model.dart';


class ProductDetails extends StatefulWidget
{
  final Product product;

  ProductDetails({@required this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
{
  final Color themeColor = Colors.yellow.shade700;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: buildAppBar(),
    );
  }

  Widget buildAppBar()
  {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Colors.black,
      title: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              child: Text(widget.product.name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          )
        ],
      ),
      actions: <Widget>[
        buildIconButton(Icons.search, Colors.yellow.shade700),
        buildIconButton(Icons.shopping_cart, Colors.white)
      ],
    );
  }

  IconButton buildIconButton(IconData icon, Color color) {
    return new IconButton(
        icon: new Icon(
          icon,
          color: color,
        ),
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
        });
  }
}
