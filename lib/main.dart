import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var initialAmount = TextEditingController();
  String displayInitial = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Budget Tracker',
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              "Balance Amount!",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Center(
            child: Text(
              ("₹ $displayInitial"),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: Center(
              child: Text(
                "Add Initial Amount",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50, // Set the desired height
                    child: TextField(
                      controller: initialAmount,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: 'Enter Initial Amount',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 50, // Set the same height as the TextField
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      displayInitial = initialAmount.text.toString();
                      setState(() {});
                    },
                    child: Text("ADD"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: TextField(),
          )
        ],
      ),
      //2nd
    );
  }
}
