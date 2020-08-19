import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'components/body.dart';

class ProductsScreen extends KFDrawerContent {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text('Products'),
      leading: IconButton(
        icon: Icon(
          Icons.sort,
          color: Colors.white,
        ),
        onPressed: widget.onMenuPressed,
      ),
    );
  }
}
