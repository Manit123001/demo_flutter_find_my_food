import 'package:demo_find_my_food/main.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

enum ListDemoType {
  oneLine,
  twoLine,
}

class Foods extends StatefulWidget {
  const Foods({Key key, this.type, this.list, this.search}) : super(key: key);

  final ListDemoType type;
  final List<Food> list;
  final String search;

  @override
  _FoodsState createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Food ${widget.search}"),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: ExcludeSemantics(
                child: CircleAvatar(child: Text('$index')),
              ),
              title: Text(
                widget.list[index].title,
              ),
              subtitle: Text(
                widget.list[index].subTitle,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DetailPage(data: widget.list[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  ListView basicListView() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        for (int index = 0; index < widget.list.length; index++)
          ListTile(
            leading: ExcludeSemantics(
              child: CircleAvatar(child: Text('$index')),
            ),
            title: Text(
              widget.list[index].title,
            ),
            subtitle: Text(
              widget.list[index].subTitle,
            ),
          ),
      ],
    );
  }
}
