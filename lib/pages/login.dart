import 'package:flutter/material.dart';
import 'package:loginsignup/auth/auth_services.dart';
import 'package:loginsignup/components/my_button.dart';
import 'package:loginsignup/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  //tap to go on register page
  final void Function()? ontap;

  LoginPage({super.key, required this.ontap});

  void login(BuildContext context) async {
    final AuthService = AuthServices();
    // try login
    try {
      await AuthService.signinwithEmailAndPassword(
          emailController.text, passController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.message,
            size: 60,
            color: Colors.black,
          ),

          //welcome msg
          SizedBox(height: 20),
          Text(
            "Welcome To Our Application",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),

          //email textfield
          SizedBox(height: 20),
          MyTextField(
            hintText: "Enter Your Email",
            obscuretext: false,
            textController: emailController,
          ),

          //pass textfield
          SizedBox(height: 20),
          MyTextField(
            hintText: "Enter Your Password",
            obscuretext: true,
            textController: passController,
          ),

          //login button
          SizedBox(height: 20),
          MyButton(text: "Login", ontap: () => login(context)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not Registered ? ",
                style: TextStyle(color: Colors.black),
              ),
              GestureDetector(
                onTap: ontap,
                child: Text(
                  " Register Now ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )

          //registration page link
        ],
      ),
    );
  }
}
