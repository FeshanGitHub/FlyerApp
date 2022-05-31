import 'package:flutter/material.dart';

class Shipments extends StatefulWidget {
  const Shipments({Key? key}) : super(key: key);

  @override
  State<Shipments> createState() => _ShipmentsState();
}

class _ShipmentsState extends State<Shipments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Text("Shipments"),
      ),
    );
  }
}
