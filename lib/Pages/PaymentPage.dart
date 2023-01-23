import 'package:codepur/Pages/Googlepay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _paymentMethod = 'Credit Card';
  late String cardNumber;
  late String expiryDate;
  late String cvv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButton(
              value: _paymentMethod,
              items: <String>['Credit Card', 'PayPal', 'Google Pay']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _paymentMethod = value!;
                });
              },
            ),
            if (_paymentMethod == 'Credit Card') ...[
              TextField(
                decoration: const InputDecoration(labelText: 'Card Number'),
                onChanged: (String value) {
                  setState(() {
                    cardNumber = value;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Expiry Date'),
                onChanged: (String value) {
                  setState(() {
                    expiryDate = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'CVV'),
                onChanged: (String value) {
                  setState(() {
                    cvv = value;
                  });
                },
              ),
            ],
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.black),
              ),
              child: const Text(
                'Pay',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => const GooglePay(),
                // ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
