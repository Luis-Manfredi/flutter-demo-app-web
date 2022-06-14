import 'package:demo_web_app/components/custom_button.dart';
import 'package:demo_web_app/constants/colors.dart';
import 'package:demo_web_app/data/user_data.dart';
import 'package:demo_web_app/screens/root.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,

      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          height: 450,
          width: 400,
          decoration: BoxDecoration(
            color: grey.withOpacity(0.05),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 2)
              )
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Welcome!', style: TextStyle(color: white, fontSize: 34)),


              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        style: TextStyle(color: white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          hintStyle: TextStyle(color: grey),
                          hintText: 'Username',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: paleOchre.withOpacity(0.5),
                              width: 2
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ochre,
                              width: 2
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                          )
                        ),
                      ),

                      const SizedBox(height: 30),

                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(color: white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          hintStyle: TextStyle(color: grey),
                          hintText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: paleOchre.withOpacity(0.5),
                              width: 2
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ochre,
                              width: 2
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                          )
                        ),
                      ),

                      const SizedBox(height: 30),

                      TextButton(
                        onPressed: (){}, 
                        child: Text('I forgot my password', style: TextStyle(color: paleOchre))
                      )
                    ],
                  ),
                )
              ),

              CustomButton(
                function: () {
                  username = _usernameController.text.toString();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Root()));
                }, 
                text: 'Continue', 
                style: TextStyle(color: white),
                height: 50, 
                width: 150,
                backgroundColor: ochre,
                iconActive: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}