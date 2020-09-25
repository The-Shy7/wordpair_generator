import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final randomWordPairs = <WordPair>[];

  Widget buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= randomWordPairs.length) {
          randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return buildRow(randomWordPairs[index]);
      },
    );
  }

  Widget buildRow(WordPair pair) {
    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('WordPair Generator')), body: buildList());
  }
}
