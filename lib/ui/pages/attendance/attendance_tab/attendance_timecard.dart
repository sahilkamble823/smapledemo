import 'package:flutter/material.dart';
class ATimeCard extends StatefulWidget {
  const ATimeCard({super.key});

  @override
  State<ATimeCard> createState() => _ATimeCardState();
}

class _ATimeCardState extends State<ATimeCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Timecard"
      ),
    );
  }
}
