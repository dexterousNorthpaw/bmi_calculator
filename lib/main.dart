import 'package:flutter/material.dart';

void main() {
  runApp(const Bmi());
}

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double squareHeight = height * height;
    double result = weight / squareHeight;
    _result = result;
    setState(() {});
  }

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Center(
            child: Text("BMI Calculator"),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Weight in Kg",
                  icon: Icon(Icons.trending_up),
                ),
              ),
              SizedBox(height: 30.0),
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Height in cm",
                  icon: Icon(Icons.line_weight),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                // style: ButtonStyle( backgroundColor: Colors.blue ),
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: calculateBMI,
              ),
              SizedBox(height: 20.0),
              Text(
                _result == null
                    ? "Enter Value"
                    : " BMI : ${_result.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
