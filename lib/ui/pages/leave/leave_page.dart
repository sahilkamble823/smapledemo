import 'package:flutter/material.dart';
import 'package:sahil_ps_demo/ui/pages/leave/leave_tabs/leave_application.dart';
import 'package:sahil_ps_demo/ui/pages/leave/leave_tabs/leave_authorized.dart';
import 'package:sahil_ps_demo/ui/pages/leave/leave_tabs/leave_status.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Leave',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                text: "Application",
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
        body: TabBarView(
          children: [
            LeaveApplication(),
            LeaveStatus(),
            LeaveAuthorization(),
            // Container(
            //   child: Center(
            //     child: Text("Tab1"),
            //   ),
            // ),
            // Container(
            //   child: Center(
            //     child: Text("Tab2"),
            //   ),
            // ),
            // Container(
            //   child: Center(
            //     child: Text("Tab3"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
