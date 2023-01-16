import 'package:codepur/Provider/FavProvider.dart';
import 'package:codepur/Widgets/Item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detailProduct.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({Key? key}) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavProductProvider>(
              builder: (context, value, child) => Column(
                children: [
                  value.CartProductList.isEmpty
                      ? Container(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "No products found",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          flex: 8,
                          child: SingleChildScrollView(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: value.CartProductList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: ListItemWidget(
                                    product: value.CartProductList[index],
                                    isFavScreen: false,
                                  ),
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailProduct(
                                              product: value
                                                  .CartProductList[index]))),
                                );
                              },
                            ),
                          ),
                        ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,
                      width: double.maxFinite,
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(children: [
                              const Text("Total:",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  "${value.CartProductList.fold(0, (previousValue, element) => previousValue + element.price)}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ]),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text("Buy now",
                                    style: TextStyle(fontSize: 14)))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
