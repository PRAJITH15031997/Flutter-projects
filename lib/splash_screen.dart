import 'package:flutter/material.dart';
import 'package:splash_screen_assigment/login_screen.dart';
import 'package:splash_screen_assigment/homepage.dart';
import 'package:splash_screen_assigment/shared_prefed.dart';

class Secondscreen extends StatefulWidget {
  const Secondscreen({super.key});

  @override
  State<Secondscreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Secondscreen> {
//veriables
//function
  @override
  void initState() {
    super.initState();

    navigatortonextscreen();
  }

  void navigatortonextscreen() async {
    await Future.delayed(const Duration(seconds: 3));
    final bool isLogged = await isGetingData();

    if (isLogged) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyLogin()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome my APP',
          style: TextStyle(color: Color.fromARGB(255, 116, 8, 8)),
        ),
      ),
      body: Center(
        child: Image.network(
          'https://cdn.logojoy.com/wp-content/uploads/20220329171712/dating-app-logo-tinder.png',
          width: 200,
          height: 100,
        ),
      ),
    );
  }
}
