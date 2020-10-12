import 'package:demo_find_my_food/foods.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Food {
  String title;
  String subTitle;
  String detail;

  Food(this.title, this.subTitle, this.detail);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'New Cafe`'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  var foods = [
    Food("Amaricano", "50.-", "Hello Hello"),
    Food("Latte", "60.-", "HO HO HO HO"),
    Food("Espresso", "60.-", "HO HO HO HO"),
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController edtSearch = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: edtSearch,
                decoration: InputDecoration(labelText: 'Enter You Menu'),
              ),
              RaisedButton(
                child: Text("Search!"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Foods(
                          type: ListDemoType.oneLine,
                          list: foods,
                          search: edtSearch.text),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
