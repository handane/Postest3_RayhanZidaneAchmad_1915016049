import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Rayhan Zidane Achmad - 1915016049"),
        ),
        body: ListData(),
      ),
    );
  }
}

class ListData extends StatefulWidget {
  const ListData({ Key? key }) : super(key: key);

  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  List names = [
    "HTML",
    "CSS",
    "PHP",
    "Ruby",
    "Python",
    "C++",
    "C#",
    "Dart",
    "Flutter",
    "Kotlin",
    "MySQL",
    "Swift",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemBuilder: (BuildContext context, int index){
        final number = index + 1;
        final name = names[index].toString();
        return Card(
          child: Padding(
            
            padding: const EdgeInsets.all(15.0),
            
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'images/_$number.JPG', width: 150,
                ),
                Text(name),
                Icon(Icons.paid),
                Text("Rp 50.000"),
                Icon(Icons.launch),
                ],
            ),
          ),
        );
      },itemCount: names.length,),
    );
  }
}
