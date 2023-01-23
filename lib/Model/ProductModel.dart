import 'package:flutter/cupertino.dart';

class Product {
  final int id;
  final String imgUrl;
  final String name;
  final int price;
  bool isFavorite;
  bool isInCart;
  int quantity;
  bool isNotBuy;
  Product(
      {required this.id,
      required this.isNotBuy,
      required this.quantity,
      required this.isInCart,
      required this.isFavorite,
      required this.imgUrl,
      required this.name,
      required this.price});
}

final myProducts = [
  Product(
    id: 0,
    imgUrl:
        "https://guesseu.scene7.com/is/image/GuessEU/M63H24W7JF0-L302-ALTGHOST?wid=1500&fmt=jpeg&qlt=80&op_sharpen=0&op_usm=1.0,1.0,5,0&iccEmbed=0",
    name: "Check Print Shirt",
    price: 200,
    isFavorite: false,
    isInCart: false,
    quantity: 0,
    isNotBuy: true,
  ),
  Product(
    id: 1,
    isFavorite: false,
    imgUrl:
        "https://guesseu.scene7.com/is/image/GuessEU/FLGLO4FAL12-BEIBR?wid=700&amp;fmt=jpeg&amp;qlt=80&amp;op_sharpen=0&amp;op_usm=1.0,1.0,5,0&amp;iccEmbed=0",
    name: "Gloria Logo Sneaker",
    price: 130,
    isInCart: false,
    quantity: 0,
    isNotBuy: true,
  ),
  Product(
    id: 2,
    isFavorite: false,
    isInCart: false,
    quantity: 0,
    imgUrl:
        "https://guesseu.scene7.com/is/image/GuessEU/HWVG6216060-TAN?wid=700&amp;fmt=jpeg&amp;qlt=80&amp;op_sharpen=0&amp;op_usm=1.0,1.0,5,0&amp;iccEmbed=0",
    name: "Cate Rigid Bag",
    price: 567,
    isNotBuy: true,
  ),
  Product(
      isFavorite: false,
      isInCart: false,
      isNotBuy: true,
      quantity: 0,
      id: 3,
      imgUrl:
          "http://guesseu.scene7.com/is/image/GuessEU/WC0001FMSWC-G5?wid=520&fmt=jpeg&qlt=80&op_sharpen=0&op_usm=1.0,1.0,5,0&iccEmbed=0",
      name: "Guess Connect Watch",
      price: 340),
  Product(
      isFavorite: false,
      quantity: 0,
      isNotBuy: true,
      isInCart: false,
      id: 4,
      imgUrl:
          "https://guesseu.scene7.com/is/image/GuessEU/AW6308VIS03-SAP?wid=700&amp;fmt=jpeg&amp;qlt=80&amp;op_sharpen=0&amp;op_usm=1.0,1.0,5,0&amp;iccEmbed=0",
      name: '70s Retro Glam Kessiah',
      price: 435),
  Product(
      isFavorite: false,
      isNotBuy: true,
      quantity: 0,
      isInCart: false,
      id: 5,
      imgUrl:
          "https://guesseu.scene7.com/is/image/GuessEU/M63H24W7JF0-L302-ALTGHOST?wid=1500&fmt=jpeg&qlt=80&op_sharpen=0&op_usm=1.0,1.0,5,0&iccEmbed=0",
      name: "Check Print Shirt",
      price: 200),
  Product(
      isInCart: false,
      quantity: 0,
      isNotBuy: true,
      isFavorite: false,
      id: 6,
      imgUrl:
          "https://guesseu.scene7.com/is/image/GuessEU/FLGLO4FAL12-BEIBR?wid=700&amp;fmt=jpeg&amp;qlt=80&amp;op_sharpen=0&amp;op_usm=1.0,1.0,5,0&amp;iccEmbed=0",
      name: "Gloria Logo Sneaker",
      price: 130),
  Product(
      isFavorite: false,
      quantity: 0,
      isNotBuy: true,
      id: 7,
      isInCart: false,
      imgUrl:
          "https://guesseu.scene7.com/is/image/GuessEU/HWVG6216060-TAN?wid=700&amp;fmt=jpeg&amp;qlt=80&amp;op_sharpen=0&amp;op_usm=1.0,1.0,5,0&amp;iccEmbed=0",
      name: "Cate Rigid Bag",
      price: 567),
  Product(
    isFavorite: false,
    isInCart: false,
    isNotBuy: true,
    quantity: 0,
    id: 8,
    imgUrl:
        "http://guesseu.scene7.com/is/image/GuessEU/WC0001FMSWC-G5?wid=520&fmt=jpeg&qlt=80&op_sharpen=0&op_usm=1.0,1.0,5,0&iccEmbed=0",
    name: "Guess Connect Watch",
    price: 423,
  ),
  Product(
      isNotBuy: true,
      isFavorite: false,
      quantity: 0,
      isInCart: false,
      id: 9,
      imgUrl:
          "https://guesseu.scene7.com/is/image/GuessEU/AW6308VIS03-SAP?wid=700&amp;fmt=jpeg&amp;qlt=80&amp;op_sharpen=0&amp;op_usm=1.0,1.0,5,0&amp;iccEmbed=0",
      name: '70s Retro Glam Kessiah',
      price: 435),
];
