import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/data/model/user.dart';
import 'package:flutter_mvvm_boilerplate/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    User? user = userProvider.user;
    final id = user != null ? user.id : '';
    final name = user != null ? user.name : '';
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('id: $id'),
              Text('name: $name'),
            ],
          ),
        ),
      ),
    );
  }
}
