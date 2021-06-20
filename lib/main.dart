import 'package:flutter/material.dart';
import 'package:test_1/suroo.dart';
import 'package:test_1/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//---------------------Varible-----------------------//
  int index = 0;
  List<String> jooptor = [];
  List<Suroo> suroolor = [
    Suroo(suroo: "kandaysyng", joop1: "android", joop2: "IOS"),
    Suroo(suroo: "Kanday", joop1: "Батарейкасы чон", joop2: "Акчасы аз"),
    Suroo(suroo: "Kanday", joop1: "Мошьный", joop2: "Бюджетный"),
  ];
//-----------------------UI------------------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Variant1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SurooText(suroolor[index].suroo),
            Joop(joop: suroolor[index].joop1, joopBer: atkar),
            Joop(joop: suroolor[index].joop2, joopBer: atkar),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (index < suroolor.length - 1) {
              index++;
            } else {
              index = 0;
            }
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

//----------------------------Methods-------------------------//
  atkar(String value) {
    jooptor.add(value);
    setState(() {
      // ignore: unrelated_type_equality_checks
      if (jooptor[0] == "android") {
        index = 1;
      } else if (jooptor[0] == "IOS") {
        index = 2;
      } else {
        print("kut");
      }
    });
    print(jooptor);
    if (jooptor[0] == "android" && jooptor[1] == "Акчасы аз") {
      _showMyDialog("samsung galaxy s8");
      index = 0;
      jooptor.clear();
    } else if (jooptor[0] == "android" && jooptor[1] == "Батарейкасы чон") {
      _showMyDialog("samsung galaxy a51");
      index = 0;
      jooptor.clear();
    } else if (jooptor[0] == "IOS" && jooptor[1] == "Мошьный") {
      _showMyDialog("iPhone 12 Pro");
      index = 0;
      jooptor.clear();
    } else if (jooptor[0] == "IOS" && jooptor[1] == "Бюджетный") {
      _showMyDialog("iPhone SE");
      index = 0;
      jooptor.clear();
    } else {
      print("kut");
    }
    setState(() {});
  }

//-------------------------Alert-------------------------//
  Future<void> _showMyDialog(String joop) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(joop),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Сиз үчүн биз $joop сунуштай алабыз'),
                Text('Бизге кайрылганыңыз үчүн рахмат'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ок'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
//---------------------------End-------------------------//
}
