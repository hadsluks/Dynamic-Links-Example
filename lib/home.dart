import 'package:dynamicLinksExample/utilities.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = new TextEditingController(),
      _controller2 = new TextEditingController(),
      _controller3 = new TextEditingController();

  void _share() async {
    String url = await getUrl(_controller1.value.text, _controller2.value.text,
        _controller3.value.text);
    shareUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Links Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: _controller1,
              decoration: InputDecoration(
                labelText: "Parameter 1",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: _controller2,
              decoration: InputDecoration(
                labelText: "Parameter 2",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: _controller3,
              decoration: InputDecoration(
                labelText: "Parameter 3",
              ),
            ),
          ),
          RaisedButton(
            child: Text("Share"),
            onPressed: _share,
          ),
        ],
      ),
    );
  }
}
