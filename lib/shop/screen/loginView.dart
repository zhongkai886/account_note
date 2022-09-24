import 'package:flutter/material.dart';
import 'package:flutter_account_note/main.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            children: [
              Text(
                'WelCome',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'UserName'),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, MyApp.CATALOG),
                child: const Text('Enter'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
