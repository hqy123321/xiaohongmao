import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String jsonStr = '[{"image": "images/a.jpg"},'
  '{"image": "images/b.jpg"},'
  '{"image": "images/c.jpg"},'
  '{"image": "images/d.jpg"},'
  '{"image": "images/e.jpg"},'
  '{"image": "images/f.jpg"},'
  '{"image": "images/g.jpg"},'
  '{"image": "images/h.jpg"},'
  '{"image": "images/i.jpg"},'
  '{"image": "images/j.jpg"},'
  '{"image": "images/k.jpg"},'
  '{"image": "images/l.jpg"},'
  '{"image": "images/m.jpg"},'
  '{"image": "images/n.jpg"},'
  '{"image": "images/o.jpg"},'
  '{"image": "images/p.jpg"},'
  '{"image": "images/q.jpg"},'
  '{"image": "images/r.jpg"},'
  '{"image": "images/s.jpg"},'
  '{"image": "images/t.jpg"},'
  '{"image": "images/u.jpg"},'
  '{"image": "images/v.jpg"},'
  '{"image": "images/w.jpg"},'
  '{"image": "images/x.jpg"}]';

   List imagesList = [] ;
  _gameJson() {
     imagesList = jsonDecode(jsonStr);
  }
  @override
  void initState() {
    super.initState();
    _gameJson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('小红猫'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          GridView.builder(
            shrinkWrap: true,
            itemCount: imagesList.length,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  child: Image.asset(imagesList[index]['image']),
                ),
                onTap: () {
                 _share(index);
                },
              );
            },
          ),
        ],
      )
    );
  }

  void _share(index) async {
    ByteData bytes = await rootBundle.load(imagesList[index]['image']);
    await WcFlutterShare.share(
      fileName: 'share.jpg',
      sharePopupTitle: 'share',
      mimeType: 'image/jpg',
      bytesOfFile: bytes.buffer.asUint8List());
  }
}