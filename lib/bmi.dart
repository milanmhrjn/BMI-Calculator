import 'package:flutter/material.dart';

class bmiHomeScreen extends StatefulWidget {
  const bmiHomeScreen({super.key});

  @override
  State<bmiHomeScreen> createState() => _bmiHomeScreenState();
}

class _bmiHomeScreenState extends State<bmiHomeScreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController cmController = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      body: SafeArea(
          child: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI Calculator",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: weightController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  label: Text(
                    "Enter your weight(in kg)",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: cmController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  label: Text(
                    "Enter your height(in cm)",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  var weight = weightController.text
                      .toString(); //changing editable to string
                  var cm = cmController.text.toString();
                  if (weight != "" && cm != "") {
                    var doubleWeight =
                        double.parse(weight); //changing string to int
                    var doubleCm = double.parse(cm);
                    var m = doubleCm / 100;
                    var bmi = doubleWeight / (m * m);
                    var msg = "";
                    if (bmi > 25) {
                      msg = "You're over weight";
                    } else if (bmi < 18) {
                      msg = "You're under weight";
                    } else {
                      msg = "You're healthy";
                    }
                    setState(() {
                      result = "Your Bmi is: ${bmi.toStringAsFixed(4)} \n$msg";
                    });
                  } else {
                    setState(() {
                      result = "Please enter all the required fields";
                    });
                  }
                },
                child: Text("Calculate"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade900),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                result,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      )),
    );
  }
}
