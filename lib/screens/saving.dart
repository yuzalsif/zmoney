import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zmoney/screens/individual-goal.dart';
import '../models/goal.dart';
import '../providers/goal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SavingScreen(),
      ),
    );
  }
}

class SavingScreen extends StatefulWidget {
  static const routeName = '/saving';

  const SavingScreen({Key? key}) : super(key: key);

  @override
  State<SavingScreen> createState() => _SavingScreenState();
}

class _SavingScreenState extends State<SavingScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoalProvider(),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 233, 233),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Individual',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Consumer<GoalProvider>(
                  builder: (context, goalProvider, child) {
                    return ListView.builder(
                      itemCount: goalProvider.individualGoals.length,
                      itemBuilder: (context, index) {
                        return ProductListItem(
                          product: goalProvider.individualGoals[index],
                          onDelete: () {
                            goalProvider.deleteGoal(index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Create a new goal'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text('Individual'),
                        onTap: () {
                          Navigator.of(context).pop(); // Close the AlertDialog
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return IndividualGoalScreen();
                              },
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text('Collaborative'),
                        onTap: () {
                          Navigator.of(context).pop(); // Close the AlertDialog

                          // Change the next line to use addGoal instead of deleteGoal
                          Provider.of<GoalProvider>(context, listen: false).addGoal(
                            Goal(
                              goalId: DateTime.now().toString(),
                              userId: '1',
                              goalName: 'Collaborative Goal', // You may need to get the goal details from the user
                              targetAmount: 0,
                              currentAmount: 0,
                              deadline: DateTime.now(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
<<<<<<< HEAD
      
=======
>>>>>>> 7547a37166274f91c387a33ced5a44acacacee51
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final Goal product;
  final VoidCallback onDelete;

  ProductListItem({required this.product, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      margin: const EdgeInsets.all(8.0),
      child: Column(children: [
        ListTile(
          leading: const CircleAvatar(child: const Icon(Icons.album)),
          title: Text('${product.goalName}'),
          subtitle: Text('${product.deadline}'),
          trailing: const Text('80%'),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: LinearProgressIndicator(
            value: product.currentAmount / product.targetAmount,
            backgroundColor: Colors.white,
            color: Color(0xFF27AE60),
            minHeight: 10.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tzs Remaining',
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              ' ${product.targetAmount - product.currentAmount}',
              style: TextStyle(color: Color(0xFF27AE60), fontSize: 15.0),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ]),
    );
  }
}


// class IndividualGoalScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your individual goal creation screen implementation goes here
//     return Container();
//   }
// }
