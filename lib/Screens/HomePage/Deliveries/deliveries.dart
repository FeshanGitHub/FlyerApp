import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Deliveries extends StatefulWidget {
  const Deliveries({Key? key}) : super(key: key);

  @override
  State<Deliveries> createState() => _DeliveriesState();
}

class _DeliveriesState extends State<Deliveries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Deliveries"),
      ),
    );
  }
}
