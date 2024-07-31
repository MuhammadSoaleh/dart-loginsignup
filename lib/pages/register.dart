import 'package:flutter/material.dart';
import 'package:loginsignup/auth/auth_services.dart';
import 'package:loginsignup/components/my_button.dart';
import 'package:loginsignup/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController ConfirmpassController = TextEditingController();

  final void Function()? ontap;

  RegisterPage({super.key, required this.ontap});

  void register(BuildContext context) {
    final auth = AuthServices();
    if (passController.text == ConfirmpassController.text) {
      try {
        auth.signupwithemailpassword(emailController.text, passController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 183, 230),
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

          //confirm pass text field
          SizedBox(height: 20),
          MyTextField(
            hintText: "Confirm Password",
            obscuretext: true,
            textController: ConfirmpassController,
          ),

          //login button
          SizedBox(height: 20),
          MyButton(text: "Login", ontap: () => register(context)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Registered ? ",
                style: TextStyle(color: Colors.black),
              ),
              GestureDetector(
                onTap: ontap,
                child: Text(
                  " Login Now ",
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
