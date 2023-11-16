import 'package:flutter/material.dart';
import 'package:jdkit/jdkit.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final jdkit = Jdkit();
  var result = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Text("result:$result"),
              ),
              button("初始化", () {
                if(Platform.isAndroid){
                  jdkit.init("49d5d16d4f8ba1411c2c1533c2308a47", "f7cf157a498c4fd18df261cc3636c16f").then((map) {
                    setState(() {
                      result = map.toString();
                    });
                  });
                }else{
                  jdkit.init("019c49bd802d23a0ae754c2b5e5c26ce", "7307938b2e084c58b8a4aa0fa0fdb19d").then((map) {
                    setState(() {
                      result = map.toString();
                    });
                  });
                }
              }),
              button("打开京东Url", () {
                jdkit.openJDUrl("https://item.m.jd.com/product/10079570184444.htm").then((map) {
                  setState(() {
                    result = map.toString();
                  });
                });
              }),
              button("打开京喜Url", () {
                jdkit.openJXUrl("https://item.m.jd.com/product/10079570184444.htm").then((map) {
                  setState(() {
                    result = map.toString();
                  });
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  button(text, Function function) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        width: double.infinity,
        height: 40,
        color: Colors.blueGrey,
        child: Center(child: Text(text)),
      ),
    );
  }
}
