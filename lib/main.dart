import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: new Haldua(),
    title: "Navigasi",
    routes: <String, WidgetBuilder>{
      '/MyApp':(BuildContext context) => new MyApp(),
      '/Haldua':(BuildContext context) => new Haldua(),
    },
  ));
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
    return new Scaffold(
      body: new Center(
      child: ListView.builder(itemBuilder: (BuildContext context, int index){
        final number = index + 1;
        final name = names[index].toString();
        return new Card(
          child: new Padding(
            
            padding: const EdgeInsets.all(15.0),
            
            child: new Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Image.asset(
                  'images/_$number.JPG', width: 150,
                ),
                Text(name),
                Icon(Icons.paid),
                Text("Rp 50.000"),
                Icon(Icons.launch),
                Container(
                  child: new IconButton(
                    icon: new Icon(Icons.launch, size: 50.0,),
                    onPressed: (){
                      Navigator.pushNamed(context, '/Haldua');
                    },
                  ),
                )
                ],
            ),
          ),
        );
      },itemCount: names.length,),
    ),
    );
  }
}

class Haldua extends StatefulWidget {
  const Haldua({ Key? key }) : super(key: key);

  @override
  State<Haldua> createState() => _HalduaState();
}

enum Gender { mahasiswa, bekerja }

class _HalduaState extends State<Haldua> {
  String namaDepan = "-", namaBelakang = "-";

  final namaDepanController = TextEditingController();
  final namaBelakangController = TextEditingController();
  bool? isActive = false;
  Gender? status = Gender.mahasiswa;

  @override
  void dispose() {
    // TODO: implement dispose

    namaDepanController.dispose();
    namaBelakangController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("formulir"),
      ),
      body: ListView(
        children: [
          Text(
            "Nama saya: ${namaDepan} ${namaBelakang}",
            style: TextStyle(fontSize: 30),
          ),
          Divider(),
          TextField(
            controller: namaDepanController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "masukkan nama",
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            maxLines: 4,
            controller: namaBelakangController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nama belakang",
            ),
          ),
          ListTile(
            leading: Radio(
              value: Gender.mahasiswa,
              groupValue: status,
              onChanged: (Gender? value) {
                setState(() {
                  status = value;
                });
              },
            ),
            title: Text("Mahasiswa"),
          ),
          ListTile(
            leading: Radio(
              value: Gender.bekerja,
              groupValue: status,
              onChanged: (Gender? value) {
                setState(() {
                  status = value;
                });
              },
            ),
            title: Text("Bekerja"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: isActive,
                onChanged: (value) {
                  setState(() {
                    isActive = value;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                namaDepan = namaDepanController.text;
                namaBelakang = namaBelakangController.text;
              });
            },
            child: Text("Tampilkan Output"),
          ),
        ],
      ),
    );
  }
}