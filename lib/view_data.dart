import 'package:flutter/material.dart';

class Viewdata extends StatelessWidget {
  final List<ViewData> studentlist1;

  // Initialize the studentlist1 parameter in the constructor

  const Viewdata({super.key, required this.studentlist1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Students List'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('STUDENT DETAILS'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(studentlist1[index].name),
                Text(studentlist1[index].address),
                Text(studentlist1[index].phoneno),
                Text(studentlist1[index].division),
              ],
            ),
          );
        },
        itemCount: studentlist1.length,
      ),
    );
  }
}

class ViewData {
  String name;

  String address;

  String phoneno;

  String division;

  ViewData(this.name, this.address, this.phoneno, this.division);
}
