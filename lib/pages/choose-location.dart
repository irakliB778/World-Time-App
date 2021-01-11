import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void printfunc() async {
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'irakli';
    });
    String about = await Future.delayed(Duration(seconds: 2), () {
      return 'programer,love basketball';
    });
    print(username + '-' + about);
  }

  @override
  void initState() {
    printfunc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        actions: [],
        title: Text('Choose a Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {},
            child: Text('Username'),
            color: Colors.grey[100],
          )
        ],
      ),
    );
  }
}
