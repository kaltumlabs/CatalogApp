import 'package:badges/badges.dart';
import 'package:codepur/Pages/CartPage.dart';
import 'package:codepur/Provider/FavProvider.dart';
import 'package:codepur/Widgets/Item_widget.dart';
import 'package:codepur/Model/ProductModel.dart';
import 'package:codepur/Pages/detailProduct.dart';
import 'package:codepur/Pages/loginPage.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("All Products"),
        centerTitle: true,
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 3, end: 18),
            animationDuration: const Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              Provider.of<FavProductProvider>(context)
                  .CartProductList
                  .length
                  .toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                padding: const EdgeInsets.only(right: 30.0),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartProduct(),
                  ));
                }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: Vx.m24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Catalog App".text.xl4.bold.make(),
                  "Treading products".text.xl.bold.make(),
                ],
              ),
            ),
            VxSwiper.builder(
              itemCount: 10,
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              isFastScrollingEnabled: false,
              //onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = myProducts[index];
                return Container(
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailProduct(product: product))),
                    child: Image.network(
                      product.imgUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 30,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: "Big discount  products".text.xl.bold.make(),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: myProducts.length,
              itemBuilder: (context, index) {
                final product = myProducts[index];
                return InkWell(
                  child: ItemWidget(product: product),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailProduct(product: product))),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            ),
            // ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: myProducts.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return ListItemWidget(product: myProducts[index]);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Column(
                children: const [
                  UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      margin: EdgeInsets.zero,
                      accountName: Text(
                        "Kishan panchal",
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      accountEmail: Text(
                        "kishan.panchal@gmail.com",
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      currentAccountPicture: CircleAvatar(
                          backgroundImage: AssetImage(
                        "assets/drawerimage.jpg",
                      ))),
                ],
              )),
          // const SizedBox(
          //   height: 5,
          // ),
          ListTile(
            onTap: () {},
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.home,
              size: 25,
              color: Colors.black,
            ),
          ),
          const Divider(),
          // const SizedBox(
          //   height: 5,
          // ),
          ListTile(
            onTap: () {},
            title: const Text(
              "Notifications",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.notifications,
              size: 25,
              color: Colors.black,
            ),
          ),
          const Divider(),
          // const SizedBox(
          //   height: 5,
          // ),
          ListTile(
            onTap: () {},
            title: const Text(
              "Profile",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.person,
              size: 25,
              color: Colors.black,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
