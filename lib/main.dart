import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var initValueController = TextEditingController();
  var discountController = TextEditingController();
  var percentualController = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(),
            Text(
              result.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Divider(),
            buildTextField("Valor inicial", initValueController),
            Divider(),
            buildTextField("Desconto", discountController),
            Divider(),
            buildTextField("inteiro/decimal", percentualController),
            Divider(),
            RaisedButton(
              onPressed: () {
                setState(() {
                  result = calculaDesconto(
                      double.parse(initValueController.text),
                      double.parse(discountController.text),
                      int.tryParse(percentualController.text));
                });
              },
              child: Text(
                "Calcular",
                style: TextStyle(fontSize: 20),
              ),
              textColor: Colors.white,
              color: Colors.blue,
              padding: const EdgeInsets.all(8),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(String label, TextEditingController c) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.blue),
        border: OutlineInputBorder()),
    style: TextStyle(color: Colors.blue, fontSize: 25),
    keyboardType: TextInputType.numberWithOptions(decimal: true),
  );
}

double calculaDesconto(double initValue, double discount, int percentual) {
  if (discount <= 0) {
    throw new ArgumentError("O desconte deve ser maior que zero");
  }
  if (initValue <= 0) {
    throw new ArgumentError("O valor inicial deve ser maior que zero");
  }
  if (percentual != 0) {
    return initValue - (initValue * discount / 100);
  }
  return initValue - discount;
}
