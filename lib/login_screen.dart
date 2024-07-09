import 'package:flutter/material.dart';
import 'package:splash_screen_assigment/homepage.dart';
import 'package:splash_screen_assigment/shared_prefed.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  final String username = 'Prajith.com';
  final String password = 'india@123';
  @override
  Widget build(BuildContext context) {
    TextEditingController usertextedit = TextEditingController();
    TextEditingController psstextedit = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(345, 567, 23, 56),
        title: const Center(child: Text('WELCOME TO LOG IN PAGE')),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300, maxHeight: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black), // add a border

            borderRadius: BorderRadius.circular(10), // add some rounded corners
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: TextField(
                  controller: usertextedit,
                  decoration: const InputDecoration(
                    labelText: 'UserName',
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                ),
                child: TextField(
                  controller: psstextedit,
                  decoration: InputDecoration(
                      labelText: 'PassWord',

                      // ignore: dead_code
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            // ignore: dead_code
                            true ? Icons.visibility_off : Icons.visibility),
                      )),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (username == usertextedit.text &&
                          password == psstextedit.text) {
                        await isUserLoggIn(true);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(seconds: 3),
                          content: Row(
                            children: [
                              Icon(Icons.warning),
                              Text("Invalid User Name/Password")
                            ],
                          ),
                        ));
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class EC {
  const EC();
}
