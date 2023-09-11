import 'package:flutter/material.dart';

class AStatus extends StatefulWidget {
  const AStatus({super.key});

  @override
  State<AStatus> createState() => _AStatusState();
}

class _AStatusState extends State<AStatus> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Status"),
    );
  }
}
