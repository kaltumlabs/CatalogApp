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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.product.isFavorite =
                              !widget.product.isFavorite;
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
                    ],
                  ),
                  StatefulBuilder(
                    builder: (context, mySetState) => Container(
                      child: widget.product.isNotBuy == true
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    value.addToCartProduct(widget.product);
                                    setState(() {
                                      widget.product.isNotBuy = false;
                                    });
                                  },
                                  icon: const Icon(Icons.add_shopping_cart)),
                            )
                          : Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (widget.product.quantity > 0) {
                                        setState(() {
                                          widget.product.quantity--;
                                          value.removeFromCartProduct(
                                              widget.product);
                                        });
                                      } else {
                                        setState(() {
                                          widget.product.isNotBuy = true;
                                          value.removeFromCartProduct(
                                              widget.product);
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                  Text(
                                      (widget.product.quantity + 1).toString()),
                                  SizedBox(
                                    width: 20,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            widget.product.quantity++;
                                            value.addToCartProduct(
                                              widget.product,
                                            );
                                          });
                                        },
                                        icon: const Icon(Icons.add)),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailProduct(product: widget.product))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.all(40),
                child: Image.network(widget.product.imgUrl),
              ),
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

  get isFavScreen => null;
  // late bool isFavScreen = false;

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
        child: Expanded(
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
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
                ),
                ElevatedButton(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
