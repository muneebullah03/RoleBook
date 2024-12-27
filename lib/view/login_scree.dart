import 'package:contact_app/res/assets/image/assets_image.dart';
import 'package:contact_app/res/colors/app_colors.dart';
import 'package:contact_app/utiles/utiles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../res/components/button/rounded_button.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreeState();
}

class _LoginScreeState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Screen',
          style: TextStyle(color: AppColors.witheText),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 120),
            Lottie.asset(AssetsImage.loginimage),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return Utiles.toastMessage('plz enter Email');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: Text('Enter Email'),
                          prefixIcon: Icon(Icons.email_outlined),
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      obscureText: isObsecure,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return Utiles.toastMessage('plz enter password');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObsecure = !isObsecure;
                              });
                            },
                            icon: Icon(isObsecure == true
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          label: Text('Enter password'),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundedButton(
                width: double.infinity,
                title: 'Login',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
