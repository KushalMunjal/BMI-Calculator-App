import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  TextEditingController numHht = TextEditingController();
  TextEditingController numWht = TextEditingController();

  String result = "";
  String selectedGender = '';

  void CalculateBMI(double height, double weight) {
    double finalresult = (weight / (height * height));
    String bmi = finalresult.toString();
    setState(() {
      result = bmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.white),
          )
        ],
      ),
      body: Column(
        children: [
          // Male and Female Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Male Button
              GestureDetector(
                onTap: () {
                  // Handle male button tap
                  setState(() {
                    selectedGender = 'Male';
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: selectedGender == 'Male'
                        ? Colors.blue
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: selectedGender == 'Male'
                          ? Colors.blue
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  child: Icon(
                    Icons.male,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(width: 20), // Spacer

              // Female Button
              GestureDetector(
                onTap: () {
                  // Handle female button tap
                  setState(() {
                    selectedGender = 'Female';
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: selectedGender == 'Female'
                        ? Colors.pink
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: selectedGender == 'Female'
                          ? Colors.blue
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  child: Icon(
                    Icons.female,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20), // Spacer

          // Height TextField
          TextField(
            textAlign: TextAlign.center,
            controller: numHht,
            decoration: InputDecoration(
              hintText: 'Your Height in CM',
              hintStyle: TextStyle(color: Colors.white),
              fillColor: Colors.black,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
          ),

          SizedBox(height: 10),

          // Weight TextField
          TextField(
            textAlign: TextAlign.center,
            controller: numWht,
            decoration: InputDecoration(
              hintText: 'Your Weight in KG',
              hintStyle: TextStyle(color: Colors.white),
              fillColor: Colors.black,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
          ),

          SizedBox(height: 20),

          Text(
            "Your BMI",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),

          // Display the calculated result
          Text(
            "$result",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 50),

          // Calculate Button
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                double height = double.tryParse(numHht.text) ?? 0.0;
                double weight = double.tryParse(numWht.text) ?? 0.0;
                CalculateBMI(height, weight);
              },
              child: Text("Calculate"),
            ),
          ),
        ],
      ),
    );
  }
}