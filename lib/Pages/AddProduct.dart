import 'package:codepur/Model/ProductModel.dart';
import 'package:codepur/Pages/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  void addProduct() {
    myProducts.add(Product(
        id: id,
        isNotBuy: false,
        quantity: 0,
        isInCart: false,
        isFavorite: false,
        imgUrl: productImageUrlController.text.toString(),
        name: productNameController.text.toString(),
        price: int.parse(productPriceController.text)));
  }

  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();
  final productImageUrlController = TextEditingController();
  final id = myProducts.length + 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                autofocus: true,
                controller: productNameController,
                decoration: const InputDecoration(hintText: "Product name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: productPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Product prce"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: productImageUrlController,
                decoration:
                    const InputDecoration(hintText: "Product image URL"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  addProduct();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                ),
                child: const Text(
                  "Add Product",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
