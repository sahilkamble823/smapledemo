import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {

  const ForgotPassword({super.key});


  @override
  Widget build(BuildContext context) {

    TextEditingController femail = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password ?',
        style: TextStyle(
         fontSize: 15,
        ),
        ),
        centerTitle: true,
        titleSpacing: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                 controller:  femail,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 500,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(

                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  ),
                ),
                onPressed: (){},
                child: Text('Send Email',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
