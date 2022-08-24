import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightSliderValue = 170;
  double _weightSliderValue = 70;
  double _bmi = 0;
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("BMI CALCULATOR")),
        body: Column(
          children: [
            Text("Bmi Calculator",
                style: TextStyle(fontSize: 40, color: Colors.red)),
            Text("We Care About Your Health"),
            Image.network("https://t3.ftcdn.net/jpg/03/20/35/28/360_F_320352822_Du18cSR0okuxVfYKgQIYYU794iqjQRAU.jpg"),
            SizedBox(
              height: 10,
            ),
            Text("Height(${_heightSliderValue.round()}cm)"),
            Slider(
              value: _heightSliderValue,
              max: 200,
              label: _heightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _heightSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("Weight(${_weightSliderValue.round()} kg)"),
            Slider(
              value: _weightSliderValue,
              max: 200,
              label: _weightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _weightSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextButton.icon(
                onPressed: () {


                  // setState((){
                  var bmiTemp = _weightSliderValue / pow((_heightSliderValue / 100), 2);
                  var messageTemp="";
                  if (bmiTemp<18){
                    messageTemp="You are UnderWeight";

                  }
                  else if(bmiTemp<25){
                    messageTemp="You Are Normal";

                  }

                  else {
                    messageTemp="You Are Overweight";
                  }
                  setState((){
                    _bmi = bmiTemp;
                    _message = messageTemp;
                  });
                  // });

                  print("Your bmi is ${_bmi.round()}");
                },
                icon: Icon(Icons.favorite),
                label: Text("Calculate")),
            _bmi !=0 ? Text("Your Bmi is ${_bmi.round()}") :  SizedBox(),
            Text(_message)
          ],
        ));
  }
}
