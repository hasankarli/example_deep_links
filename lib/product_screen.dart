import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String productId;

  const ProductScreen({Key key, this.productId}) : super(key: key);
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${widget.productId} Products"),
      ),
    );
  }
}
