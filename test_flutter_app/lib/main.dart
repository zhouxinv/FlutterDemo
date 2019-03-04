import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor:Colors.orange,
      ),
      home: new RandomWords(),
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
////          child: new Text('Hello World'),
////            child: new Text(wordPair.asPascalCase),
//        child: new RandomWords(),
//        ),
//
//      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
//    final wordPair =  new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Startup Name Generator'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
          ],
          ),
        body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
        new MaterialPageRoute(
             builder: (context) {
               final tiles = _saved.map(
                   (pair) {
                     return new ListTile(
                       title: new Text(
                         pair.asPascalCase,
                         style: _biggerFont,
                       ),
                     );
                   }
               );
               final divided = ListTile
               .divideTiles(
                 context: context,
                 tiles: tiles,
               )
               .toList();
               return new Scaffold(
                 appBar: new AppBar(
                   title: new Text('收藏列表'),
                 ),
                 body: new ListView(children: divided),
               );
             }
            ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
      itemBuilder: (context, i) {
        // 每列之前, 添加一个1像素高的分割线widget
        // 判断为基数
        if(i.isOdd) return new Divider();
        // 语法 "i ~/ 2" 表示i除以2, 但返回值是整形(向下取整), 比如i为: 1, 2, 3, 4, 5时
        // 结果为0, 1, 1, 2, 2, 这可以计算出ListView中减去分隔线后的实际单词对数量
        final index = i ~/ 2;
        // 如果建议列表中最后一个单词对
        if (index >= _suggestions.length) {
          // ... 接着再生成10个单词对, 然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(10));
        }
        // 展示文字行的时候调用
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing:  new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}