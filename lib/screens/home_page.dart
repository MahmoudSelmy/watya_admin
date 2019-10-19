import 'package:flutter/material.dart';
import 'package:watya_app/utils/dimensions_manager.dart';
import 'package:watya_app/screens/homepage/home_app_bar_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DimensionsManager _dimenManager = DimensionsManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar.build(),
    );
  }

}
