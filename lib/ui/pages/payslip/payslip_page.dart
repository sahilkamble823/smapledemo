import 'package:flutter/material.dart';

class PaySlipPage extends StatefulWidget {
  const PaySlipPage({super.key});

  @override
  State<PaySlipPage> createState() => _PaySlipPageState();
}

class _PaySlipPageState extends State<PaySlipPage> {

  void _showdatepicker(){

    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaySlip',
          style: TextStyle(
            fontSize: 15,
          ),
        ),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                onTap: _showdatepicker,
                decoration: const InputDecoration(
                  hintText: 'Select Month and Year',
                  prefixIcon: Icon(Icons.calendar_month),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 500,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(

                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.amber),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  ),
                ),
                onPressed: (){},
                child: const Text('Open PDF',
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
