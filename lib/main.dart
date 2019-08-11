import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Gherkin Demo',
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _value = 0;
  void valueUp() {
    setState(() {
      _value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Jeresy Cool!', key: Key('firstTabTitle')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Text('Hello, Jersey!', 
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 30,
              ),
              key: Key('textField')),
            Text('$_value', 
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w100,
                fontFamily: 'Roboto',
                fontSize: 30,
              ),
              key: Key('counterTextField')),
            FloatingActionButton(
              tooltip: 'Add', // used by assistive technologies
              child: Icon(Icons.add_circle, key: Key('addBtn')),
              onPressed: valueUp,
            ),
            RaisedButton(
              child: Text('Open Second Tab', 
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 15,
              ),
              key: Key('openBtn')),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
          ]
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jersey Second Tab", key: Key('secondTabTitle')),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!', 
          style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 15,
          ),
          key: Key('goBackBtn')),
        ),
      ),
    );
  }
}

