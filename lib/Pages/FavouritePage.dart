import 'dart:math';

import 'package:codepur/Model/ProductModel.dart';
import 'package:codepur/Provider/FavProvider.dart';
import 'package:codepur/Widgets/Item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'detailProduct.dart';

class FavProduct extends StatefulWidget {
  const FavProduct({Key? key}) : super(key: key);

  @override
  State<FavProduct> createState() => _FavProductState();
}

class _FavProductState extends State<FavProduct> {
  // bool isLoading = false;
  // void shimmerFunc() {
  //   Future.delayed(
  //       const Duration(seconds: 2),
  //       () => {
  //             setState(() {
  //               isLoading = true;
  //               isOneTime = false;
  //             })
  //           });
  // }
  //
  // bool isOneTime = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Product'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Consumer<FavProductProvider>(
          builder: (context, value, child) => value.favProductList.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "No Favourite Products",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              // : isLoading == true
              //     ? Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: SizedBox(
              //             width: double.maxFinite,
              //             height: 40,
              //             child: VxShimmer(
              //                 child: Container(
              //               decoration:
              //                   BoxDecoration(color: Colors.blueGrey.shade200),
              //             ))),
              //       )
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.favProductList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: ListItemWidget(
                        product: value.favProductList[index],
                        isFavScreen: true,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailProduct(
                                  product: value.favProductList[index]))),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
