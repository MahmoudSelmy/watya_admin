import 'package:flutter/material.dart';
import 'package:watya_app/core/models/product_model.dart';
import 'package:watya_app/screens/widgets/product_details_page.dart';


class ProductCard extends StatelessWidget {
  final Product productDetails;

  ProductCard({@required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(product: productDetails)));
      },
      child: Padding(
        padding: EdgeInsets.all(1),
        child: Card(
          elevation: 1.0,
          child: Container(
            height: MediaQuery.of(context).size.width * 0.4 * (10/7),
            width: MediaQuery.of(context).size.width * 0.4,
            child: Stack(
              children: <Widget>[
                buildCardContent(context),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                    child: Container(
                      height: 30,
                      width: 40,
                      color: Colors.black,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("-${calcOffer()}%", style: TextStyle(color: Colors.yellow.shade700),)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int calcOffer()
  {
    double ratio = productDetails.price / productDetails.basePrice;
    double percentage = (1.0 * ratio) * 100;
    return percentage.floor();
  }
  IntrinsicWidth buildCardContent(BuildContext context) {
    return IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: productDetails.id,
                    child: Image.network(
                      productDetails.images[0],
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.25,
                    ),
                  ),
                  flex: 7,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: IntrinsicWidth(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "Adidas",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            productDetails.name,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            '${productDetails.price} DH',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                color: Colors.yellow.shade700),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
