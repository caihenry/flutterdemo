import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var homePage = HomePage();
    return MaterialApp(
      title: 'MaterialApp Demo',
      theme: ThemeData(
          accentColor: Colors.greenAccent, primaryColor: Colors.purple),
      home: homePage,
      routes: {
        '/home': (BuildContext context) => homePage,
        '/detail': (BuildContext context) => DetailPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {  
  int _currentIndex = 0;
  final List<String> _titles = ['首页', '数据', '我的'];
  final List<Widget> _children = [
    FirstPage(),
    PlaceholderPage(Colors.blue),
    PlaceholderPage(Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(this._titles[this._currentIndex]),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerItem(1),
            DrawerItem(2),
            DrawerItem(3),
            DrawerItem(4),
            DrawerItem(5),
            DrawerItem(6),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('主页')),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), title: Text('数据')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
        ],
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;            
          });
        },
      ),
      body: this._children[this._currentIndex],
    );
  }
}

class FirstPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/detail');
          },
          child: Text(
            '首页，点击跳转详情页。',
            style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                decoration: TextDecoration.none),
          ),
        ),
      );
  }
}

class PlaceholderPage extends StatelessWidget {
  
  final Color _color;

  PlaceholderPage(this._color);

  @override
  Widget build(BuildContext context) {    
    return  Container(
        color: this._color,                      
      );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('详情页'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            '详情页，点击返回首页。',
            style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final int _id;

  DrawerItem(this._id);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.green))),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('列表' + this._id.toString())],
      ),
    );
  }
}
