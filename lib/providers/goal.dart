import 'package:flutter/material.dart';
import 'package:zmoney/models/goal.dart';

class GoalProvider extends ChangeNotifier {
  List<Goal> _individualGoals = [
    Goal(
      goalId: '1',
      userId: '1',
      goalName: 'New Car',
      targetAmount: 10000,
      currentAmount: 5000,
      deadline: DateTime.now(),
    ),
    Goal(
      goalId: '2',
      userId: '1',
      goalName: 'Vacation',
      targetAmount: 5000,
      currentAmount: 2000,
      deadline: DateTime.now(),
    ),
  ];

  List<Goal> get individualGoals => _individualGoals;

  void addGoal(Goal goal) {
    _individualGoals.add(goal);
    notifyListeners();
  }

  void deleteGoal(int index) {
    _individualGoals.removeAt(index);
    notifyListeners();
  }
}
