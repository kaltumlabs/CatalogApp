import 'package:codepur/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Product product;
  const ItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridTile(
          header: Container(
              // margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration:  const BoxDecoration(color: Colors.black,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
              child: Text(
                product.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              )),
          footer: Center(
            child: Text(
              "\$${product.price}",
              style: const TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Image.network(product.imgUrl),
          ),
        ),
      ),
    );
  }
}
