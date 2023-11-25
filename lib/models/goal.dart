class Goal {
  String goalId;
  String userId;
  String goalName;
  double targetAmount;
  double currentAmount;
  DateTime deadline;

  Goal({
    required this.goalId,
    required this.userId,
    required this.goalName,
    required this.targetAmount,
    required this.currentAmount,
    required this.deadline,
  });
}
 