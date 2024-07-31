import 'package:flutter/material.dart';
import 'package:loginsignup/auth/auth_services.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  void logout() {
    final _auth = AuthServices();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to our application, sir/madam"),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
    );
  }
}
