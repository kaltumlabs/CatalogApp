import 'package:codepur/Item_widget.dart';
import 'package:codepur/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Product page'),
          centerTitle: true,
        ),
        body: GridView.builder(
          itemCount: myProducts.length,
          itemBuilder: (context, index) {
            return ItemWidget(product: myProducts[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        )

        // This trailing comma makes auto-formatting nicer for build methods.
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
                      accountName: Text("Kishan panchal",        style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
                      accountEmail: Text("kishan.panchal@gmail.com",        style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
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
