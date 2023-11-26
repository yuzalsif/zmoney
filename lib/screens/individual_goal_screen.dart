import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zmoney/models/goal.dart';

import '../providers/goal.dart';

class IndividualGoalScreen extends StatefulWidget {
  @override
  _IndividualGoalScreenState createState() => _IndividualGoalScreenState();
}

class _IndividualGoalScreenState extends State<IndividualGoalScreen> {
  final _formKey = GlobalKey<FormState>();
  String? goalName;
  double? targetAmount;
  double? currentAmount;
  DateTime? deadline;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        deadline = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
          255,
          235,
          233,
          233,
        ), // Set a transparent background
        elevation: 0, // Remove the elevation shadow
        title: Text(
          'z money', // Your app title
          style: GoogleFonts.caveatBrush(
            textStyle: const TextStyle(
              color: Colors.black, // Text color
              fontSize: 32, // Adjust the size as needed
            ),
          ),
        ),
        centerTitle: true, // Center the title horizontally
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'New Individual Goal',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Goal Name',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a goal name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      goalName = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Target Amount',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a target amount';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      targetAmount = double.tryParse(value!);
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Current Amount',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a current amount';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      currentAmount = double.tryParse(value!);
                    },
                  ),
                  const SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Deadline',
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      child: Text(
                        deadline != null
                            ? '${deadline!.day}/${deadline!.month}/${deadline!.year}'
                            : 'Select a deadline',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Access the GoalProvider using the context
                          GoalProvider goalProvider = context.read<GoalProvider>();

                          // Create a new Goal object
                          Goal newGoal = Goal(
                            goalId: DateTime.now().toString(),
                            userId: '1',
                            goalName: goalName!,
                            targetAmount: targetAmount!,
                            currentAmount: currentAmount!,
                            deadline: deadline!,
                          );

                          // Add the new goal to the list
                          goalProvider.addGoal(newGoal);

                          // Close the screen
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
