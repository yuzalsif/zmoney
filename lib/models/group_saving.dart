class GroupSaving {
  String groupId;
  String groupName;
  List<String> memberUserIds;
  double totalAmount;
  double targetAmount;
  DateTime deadline;

  GroupSaving({
    required this.groupId,
    required this.groupName,
    required this.memberUserIds,
    required this.totalAmount,
    required this.targetAmount,
    required this.deadline,
  });
}
