import 'package:flutter/material.dart';
import 'dart:math';  // Importăm biblioteca math pentru funcția pow

void main() {
  runApp(LoanCalculatorApp());
}

class LoanCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pink[50],
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.pink[800]),  // Înlocuim bodyText2 cu bodyMedium
        ),
      ),
      home: LoanCalculatorScreen(),
    );
  }
}

class LoanCalculatorScreen extends StatefulWidget {
  @override
  _LoanCalculatorScreenState createState() => _LoanCalculatorScreenState();
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  double _amount = 0;
  int _months = 1;
  double _interest = 0;
  double _monthlyPayment = 0;

  void _calculateLoan() {
    setState(() {
      if (_interest > 0 && _months > 0) {
        double monthlyInterestRate = _interest / 100;
        _monthlyPayment = (_amount * monthlyInterestRate) /
            (1 - pow(1 / (1 + monthlyInterestRate), _months));  // Folosim pow din dart:math
      } else {
        _monthlyPayment = _amount / _months;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Calculator'),
        backgroundColor: Colors.pink[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter amount',
                labelStyle: TextStyle(color: Colors.pink[800]),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _amount = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16),
            Text('Enter number of months:'),
            Slider(
              value: _months.toDouble(),
              min: 1,
              max: 60,
              divisions: 59,
              label: _months.toString(),
              activeColor: Colors.pink,
              onChanged: (value) {
                setState(() {
                  _months = value.toInt();
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter % per month',
                labelStyle: TextStyle(color: Colors.pink[800]),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _interest = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateLoan,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[400],  // Folosim backgroundColor în loc de primary
              ),
              child: Text('Calculate'),
            ),
            SizedBox(height: 30),
            Text(
              'You will pay the approximate amount monthly:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              _monthlyPayment.toStringAsFixed(2) + '€',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pink[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
