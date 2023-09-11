import 'package:flutter/material.dart';
import 'package:sahil_ps_demo/ui/pages/attendance/attendance_tab/attendance_authorization.dart';
import 'package:sahil_ps_demo/ui/pages/attendance/attendance_tab/attendance_status.dart';
import 'package:sahil_ps_demo/ui/pages/attendance/attendance_tab/attendance_timecard.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Leave',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                text: "TimeCard",
              ),
              Tab(
                text: "Status",
              ),
              Tab(
                text: "Authorization",
              ),
            ],
          ),
        ),
        body:  const TabBarView(
          children: [
            ATimeCard(),
            AStatus(),
            AAuthorization(),
          ],
        ),
      ),
    );
  }
}
