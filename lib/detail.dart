import 'package:demo_find_my_food/main.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key, this.data}) : super(key: key);

  final Food data;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(widget.data.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Hello World"),
            Text(widget.data.detail),
          ],
        ),
      ),
    );
  }
}
