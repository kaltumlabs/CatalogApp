import 'package:codepur/Model/ProductModel.dart';
import 'package:codepur/Pages/FavouritePage.dart';
import 'package:codepur/Provider/FavProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Pages/detailProduct.dart';

class ItemWidget extends StatefulWidget {
  final Product product;
  const ItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridTile(
          header: Container(
              // margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 4),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Text(
                widget.product.name.capitalized,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              )),
          footer: Consumer<FavProductProvider>(
            builder: (context, value, child) => Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      widget.product.isFavorite = !widget.product.isFavorite;
                      value.addToFavProduct(widget.product);
                    },
                    icon: widget.product.isFavorite == true
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          )
                        : const Icon(Icons.favorite_border),
                  ),
                  Text(
                    "\$${widget.product.price}",
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
                      widget.product.isInCart =
                          widget.product.isInCart.toggle();
                      value.addToCartProduct(widget.product);
                    },
                    child: widget.product.isInCart == false
                        ? const Icon(Icons.add_shopping_cart)
                        : const Icon(Icons.remove_shopping_cart),
                  ),
                ],
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Image.network(widget.product.imgUrl),
            ),
          ),
        ),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  ListItemWidget({Key? key, required this.product, required bool isFavScreen})
      : super(key: key);
  final Product product;
  late bool isFavScreen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shadowColor: Colors.grey,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 1,
        child: ListTile(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailProduct(product: product))),
          leading: Image.network(product.imgUrl),
          title: Text(
            product.name,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          subtitle: Text(
            "\$${product.price}",
            style: const TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          trailing: isFavScreen == true
              ? IconButton(
                  onPressed: () {
                    product.isFavorite = !product.isFavorite;
                    Provider.of<FavProductProvider>(context, listen: false)
                        .addToFavProduct(product);
                  },
                  icon: product.isFavorite == true
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.pink,
                        )
                      : const Icon(Icons.favorite_border),
                )
              : ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 0)),
                  onPressed: () {
                    product.isInCart = product.isInCart.toggle();
                    Provider.of<FavProductProvider>(context, listen: false)
                        .addToCartProduct(product);
                  },
                  child: product.isInCart == false
                      ? const Icon(Icons.add_shopping_cart)
                      : const Icon(Icons.remove_shopping_cart),
                ),
        ),
      ),
    );
  }
}
