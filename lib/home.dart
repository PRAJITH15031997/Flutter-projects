import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_assigment/login_screen.dart';
import 'package:splash_screen_assigment/shared_prefed.dart';
import 'package:splash_screen_assigment/view_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final _formKey = GlobalKey<FormState>();
    final List<ViewData> studentList = [];
    final name = TextEditingController();

    final address = TextEditingController();

    final phone = TextEditingController();
    final division = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(88, 57, 138, 134),
          title: const Text(
            'Entroll Form',
            style: TextStyle(color: Colors.black45),
            textAlign: TextAlign.center,
          ),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.menu),
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: ElevatedButton(
                  onPressed: () async {
                    await isUserLoggIn(false);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyLogin()));
                  },
                  child: const Text('Log Out'),
                )),
              ],
            ),
          ],
          iconTheme: const IconThemeData(
            color: Color.fromARGB(234, 56, 76, 21),
          ),
        ),
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 30,
                bottom: 10,
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'Name', border: OutlineInputBorder()),
                style: const TextStyle(color: Colors.black),
                controller: name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 5,
                bottom: 5,
              ),
              child: TextField(
                maxLines: 2,
                decoration: const InputDecoration(
                    labelText: 'Address', border: OutlineInputBorder()),
                style: const TextStyle(color: Colors.black),
                controller: address,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 5,
                bottom: 5,
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'PhoneNumber', border: OutlineInputBorder()),
                style: const TextStyle(color: Colors.black),
                controller: phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 5,
                bottom: 5,
              ),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'Division', border: OutlineInputBorder()),
                style: const TextStyle(color: Colors.black),
                controller: division,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () async {
                  ViewData student = ViewData(
                      name.text, address.text, phone.text, division.text);
                  studentList.add(student);
                  print(student);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Successfully Register '),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'))
                          ],
                        );
                      });

                  /*SharedPreferences regist =
                      await SharedPreferences.getInstance();

                  regist.setString('name', name.text);
                  regist.setString('address', address.text);
                  regist.setString('phoneno', phone.text);
                  regist.setString('division', division.text);*/
                  name.clear();
                  address.clear();
                  phone.clear();
                  division.clear();
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Viewdata(studentlist1: studentList)));
                },
                child: const Text(
                  'View Students',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ));
  }
}
