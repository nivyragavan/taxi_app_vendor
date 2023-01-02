import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final searchDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Transaction History'),
      drawer: const DrawerWidget(),
      body: buildTransactionHistory(),
    );
  }

  buildTransactionHistory() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            controller: searchDate,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGreen, width: 2)),
                hintText: 'Enter transaction date',
                suffixIcon: const Icon(Icons.search)),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101));
              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement

                setState(() {
                  searchDate.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {
                print("Date is not selected");
              }
            },
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 2),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text('ABCDE12345'),
                        ), // booking id
                        subtitle: const Text('G pay'), // payment method
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('\u{20B9} 450'), // amount
                            SizedBox(height: 5),
                            Text('31-05-2022') // date of transaction
                          ],
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
