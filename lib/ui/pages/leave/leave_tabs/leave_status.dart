import 'package:flutter/material.dart';

class LeaveStatus extends StatefulWidget {
  const LeaveStatus({super.key});

  @override
  State<LeaveStatus> createState() => _LeaveStatusState();
}

class _LeaveStatusState extends State<LeaveStatus> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("leave status"),
    );
  }
}
