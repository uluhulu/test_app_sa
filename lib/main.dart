import 'package:flutter/material.dart';
import 'package:test_app/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/theme_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.isDark ? ThemeData.dark() : ThemeData.light(),
            home: LoginDemo(),
          );
        },
      ),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          actions: [
            Switch(
              value: state.isDark,
              onChanged: (bool newValue) async {
               await BlocProvider.of<ThemeBloc>(context).changeIsDark();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child:
                      Container(width: 200, height: 150, child: FlutterLogo()),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Text('New User? Create Account')
            ],
          ),
        ),
      );
    });
  }
}
