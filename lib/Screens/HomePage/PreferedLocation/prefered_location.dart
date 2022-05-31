import 'package:flutter/material.dart';

class PreferedLocMainMenu extends StatefulWidget {
  const PreferedLocMainMenu({Key? key}) : super(key: key);

  @override
  State<PreferedLocMainMenu> createState() => _PreferedLocMainMenuState();
}

class _PreferedLocMainMenuState extends State<PreferedLocMainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("PreferedLocation"),
      ),
    );
  }
}
