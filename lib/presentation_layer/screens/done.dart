import 'package:flutter/material.dart';

class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("done",style: TextStyle(color: Colors.greenAccent),)),
    );
  }
}
