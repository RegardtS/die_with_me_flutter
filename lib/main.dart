import 'package:flutter/material.dart';
import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Text(
                'Die With Me',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(
                '3%',
                style: TextStyle(
                    color: Colors.red[900], fontStyle: FontStyle.italic),
              ),
            ],
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Home(),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chatLists.length,
        itemBuilder: (context, index) {
          return _listTile(context, index);
        });
  }
}

Widget _listTile(BuildContext context, int index) {
  return Container(
    color: Colors.black,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            index == 2 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 2.0),
                    child: Text('${chatLists[index].battery}%',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  child: Text('${chatLists[index].text}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.0),
          Text('${chatLists[index].username} @ ${chatLists[index].datePosted}',
              style:
                  TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
        ],
      ),
    ),
  );
}
