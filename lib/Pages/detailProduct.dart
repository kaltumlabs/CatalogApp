import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Model/ProductModel.dart';
import '../Provider/FavProvider.dart';

class DetailProduct extends StatelessWidget {
  final Product product;
  const DetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 10.0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 360,
              child: Image.network(
                product.imgUrl,
                fit: BoxFit.fill,
              ),
            ),
            const Divider(
              color: Colors.black,
              indent: 20,
              endIndent: 20,
            ),
            Text(
              product.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "When looking at its layout. The point of using Lorem Ipsum is that it has"
                " a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',"
                " making it look like readable English. Many desktop publishing packages ",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "There are many variations of passages of Lorem Ipsum available,"
                " but the majority have suffered alteration in some form, by injected humour.",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Consumer<FavProductProvider>(
              builder: (context, value, child) => Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        product.isFavorite = !product.isFavorite;
                        value.addToFavProduct(product);
                      },
                      icon: product.isFavorite == true
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            )
                          : const Icon(Icons.favorite_border),
                    ),
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          elevation:
                              MaterialStateProperty.resolveWith((states) => 0)),
                      onPressed: () {
                        product.isInCart = product.isInCart.toggle();
                        value.addToCartProduct(product);
                      },
                      child: product.isInCart == false
                          ? const Icon(Icons.add_shopping_cart)
                          : const Icon(Icons.remove_shopping_cart),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
