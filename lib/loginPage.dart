import 'package:codepur/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final  TextEditingController _loginController = TextEditingController();
 final  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  child: Image.asset(
                    "assets/login.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      "Welcome to Login Page",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        controller: _loginController,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        controller: _passwordController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                              minimumSize: const Size(100, 40),
                              backgroundColor: Colors.deepPurpleAccent),
                          onPressed: () {
                            if (_loginController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MyHomePage(),
                              ));
                            } else {
                              const snackBar = SnackBar(
                                content: Text("field must be filled"),
                                duration: Duration(seconds: 2),
                                backgroundColor: (Colors.black),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 18),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
