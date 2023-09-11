import 'package:flutter/material.dart';

class WallPost extends StatelessWidget {
  const WallPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wall Post',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        centerTitle: true,
        titleSpacing: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 400,
              child: Card(
                color: Colors.grey[200],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 200,
              width: 400,
              child: Card(
                color: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
