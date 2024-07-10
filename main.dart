import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color inactiveColor = const Color.fromARGB(255, 74, 2, 69);
  Color activeColor = const Color.fromARGB(255, 48, 2, 43);

  int _selectedGender = -1;
  int height = 160;
  int age = 20;
  int weight = 63;
  int currentIndex = 30;
  double _bimCalcu= 0.0;

  Widget _buildCalcu() {
    return Column(
      children: [
        _genderSelector(),
        _height(),
        _weightandage(),
        _bmiCalcu(),
      ],
    );
  }

  Widget _genderSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedGender = 0;
            });
          },
          child: Container(
            width: 180,
            height: 200,
            decoration: BoxDecoration(
              color: _selectedGender == 0 ? activeColor : inactiveColor,
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Icon(
                  Icons.male,
                  color: _selectedGender == 0
                      ? Theme.of(context).colorScheme.onPrimary
                      : Colors.white,
                  size: 90,
                ),
                const SizedBox(
                  height: 10.0,
                  width: 50,
                ),
                const Text(
                  "Male",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedGender = 1;
            });
          },
          child: Container(
            width: 190,
            height: 200,
            decoration: BoxDecoration(
              color: _selectedGender == 1 ? activeColor : inactiveColor,
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Icon(
                  Icons.female,
                  color: _selectedGender == 1
                      ? Theme.of(context).colorScheme.onPrimary
                      : Colors.white,
                  size: 90,
                ),
                const SizedBox(
                  height: 10.0,
                  width: 20,
                ),
                const Text(
                  "Female",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 112, 3, 101),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 112, 3, 101),
      ),
      body: Center(
        child: _buildCalcu(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {

     _bimCalcu = weight / pow(height / 100, 2);
 
           });
        },
        child: const Icon(
          Icons.calculate,
        ),
      ),
    );
  }

  Widget _height() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Container(
              width: 400,
              height: 160,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 74, 2, 69),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    "Height",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "$height cm",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 220,
                    divisions: 120,
                    label: height.toString(),
                    onChanged: (value) {
                      setState(() {
                        height = value.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _weightandage() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 180,
            height: 150,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 74, 2, 69),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Weight",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                  width: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (weight > 30) weight--;
                        });
                      },
                    ),
                    Text(
                      '$weight',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (weight < 350) weight++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 180,
            height: 150,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 74, 2, 69),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Age",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                  width: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (age > 1) age--;
                        });
                      },
                    ),
                    Text(
                      '$age',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (age < 100) age++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
Widget _bmiCalcu(){
return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 400,
            height: 70,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 74, 2, 69),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "BMI:$_bimCalcu",
              style: const TextStyle(fontSize: 25,
              color: Colors.white

              ),
              ),
        
          ),
        ]
      ),
); 
    
}


}
