import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    // 标题
    var titleText = new Text(
      'Strawberry Pavlova',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
      )
    );

    var subTitle = new Text(
        '''
        Pavlova is a meringue-based dessert named after the Russian ballerine Anna pavlova.Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.
        ''',
      softWrap: true,

    );

    // 评分reviews行
    var ratings = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
            ],
          ),
          new Text(
            '170 Reviews',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize:20.0,
            ),
          ),
        ],
      ),

    );

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    //DefaultTextStyle.merge 可以允许您创建一个默认的文本样式, 该样式会被其他所有子节点继承
    var iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: new Container(
          padding:  new EdgeInsets.all(20),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Icon(Icons.kitchen, color: Colors.green[500],),
                    new Text('PREP:'),
                    new Text('25 min'),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Icon(Icons.timer, color: Colors.green[500],),
                    new Text('COOK:'),
                    new Text('1 hr'),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Icon(Icons.restaurant, color: Colors.green[500],),
                    new Text('FEEDS:'),
                    new Text('4-6'),
                  ],
                )
              ],
              
            ),
        )
    );

    var leftColumn = new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: new Column(
        children: <Widget>[
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );
    
    var mainImage = new Image.asset('images/cake.jpg');

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: new Container(
          margin: new EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
          height: 600,
          child: new Card(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: 440.0,
                  child: leftColumn,
                ),
                mainImage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
