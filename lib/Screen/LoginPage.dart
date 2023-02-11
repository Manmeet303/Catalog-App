import 'package:flutter/material.dart';
import 'package:myfirstproject/main.dart';
import 'package:myfirstproject/utils/Routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  //Creating a function to performe the validation in such a way that is it validates than only perform the below task
  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 400));
      //if users goes back to the login page from the home page than the changed ticked button will be undo to the normal button
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.theme.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 15.0),

//Image on the Login Page
                Image.asset("assets/images/login.png", fit: BoxFit.cover),
                SizedBox(height: 20.0),

//Welcome Text with the dynamic username
                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // SizedBox(
                //     height: 20.0
                // ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
//Enter Username Field with the validating empty values
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),

//Enter the Password Field with the Validating empty values as well as at least length must be less than 6
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.toString().length < 6) {
                            return "Password Length should be atleast 6";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 20.0),

//can wrap with the inkwell or Gesturedetector
                      InkWell(
//onTap Functionality
                        onTap: () => moveToHome(context),

//Making this simple container to the animated container

//A normal Container and ink are almost same but the ink provides the more decoration to the text like we can add the ripple effect and many more to the button
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                          decoration: BoxDecoration(
                              color: context.theme.shadowColor,
                              borderRadius:
                                  BorderRadius.circular(changeButton ? 50 : 8)),
                        ),
                      ),

// IF want to use the elevated Button instead of the container
                      // ElevatedButton(
                      //     onPressed: () {
                      //      Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //     },
                      //     child: Text("Login"),
                      //     style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
