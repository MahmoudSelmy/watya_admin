import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watya_app/screens/home_page.dart';
import 'package:watya_app/screens/views/add_product.dart';
import 'package:watya_app/screens/views/home_screen.dart';
import 'package:watya_app/screens/widgets/product_details.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
            builder: (_)=> HomePage()
        );
      case '/addProduct' :
        return MaterialPageRoute(
            builder: (_)=> AddProduct()
        ) ;
      case '/productDetails' :
        return MaterialPageRoute(
            builder: (_)=> ProductDetails()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}