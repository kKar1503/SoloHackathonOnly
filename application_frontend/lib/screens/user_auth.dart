import 'package:application_frontend/screens/home.dart';
import 'package:application_frontend/utils/auth.dart';

import 'package:application_frontend/utils/http.dart';
import 'package:flutter/material.dart';
import 'package:application_frontend/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserAuth extends StatefulWidget {
  const UserAuth({Key? key}) : super(key: key);

  @override
  _UserAuthState createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        LoginPage(
          register: () {
            controller.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          },
        ),
        SignUp(login: () {
          controller.previousPage(
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        }),
      ],
    );
  }
}

class LoginPage extends StatefulWidget {
  final VoidCallback register;
  const LoginPage({Key? key, required this.register}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _canLogin = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      backgroundColor: offWhite,
      // extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: -150,
                      top: -150,
                      child: Container(
                        child: SizedBox(
                          height: 400,
                          width: 400,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [magenta, blue],
                          ),

                          shape: BoxShape.circle,
                          // color: blue,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      top: 100,
                      child: Text(
                        "Doctor.io",
                        style: TextStyle(
                            color: offWhite, fontWeight: kbold, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView(
                    children: [
                      //email
                      Text(
                        "Email:",
                        style: TextStyle(
                            fontWeight: kmedium, color: navyBlue, fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "something@email.com",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: blue,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                      Text(
                        "Password:",
                        style: TextStyle(
                            fontWeight: kmedium, color: navyBlue, fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Enter your email";
                            }
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            // HttpService().linkTelegram();
                            Auth auth = Auth();

                            String email = _emailController.value.text;
                            String password = _passwordController.value.text;
                            bool shouldNavigate =
                                await auth.login(email, password);
                            if (shouldNavigate) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Home(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: blue,
                              minimumSize: Size(width, 48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                            onPressed: widget.register,
                            child: Text(
                              "Register instead",
                              style: TextStyle(fontSize: 16.0),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  final VoidCallback login;
  const SignUp({Key? key, required this.login}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _nricController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dobController = TextEditingController();

  bool _doctorCheck = false;
  bool _patientCheck = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      backgroundColor: offWhite,
      // extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: -150,
                      top: -150,
                      child: Container(
                        child: SizedBox(
                          height: 400,
                          width: 400,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [magenta, blue],
                          ),

                          shape: BoxShape.circle,
                          // color: blue,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      top: 100,
                      child: Text(
                        "Doctor.io",
                        style: TextStyle(
                            color: offWhite, fontWeight: kbold, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView(
                    children: [
                      Text(
                        "First Name:",
                        style: TextStyle(
                            fontWeight: kmedium, color: navyBlue, fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: TextFormField(
                          controller: _firstNameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "John",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: blue,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),

                      Text(
                        "Last Name:",
                        style: TextStyle(
                            fontWeight: kmedium, color: navyBlue, fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: TextFormField(
                          controller: _lastNameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Doe",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: blue,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                      //email
                      Text(
                        "Email:",
                        style: TextStyle(
                            fontWeight: kmedium, color: navyBlue, fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "something@email.com",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: blue,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                      Text(
                        "Password:",
                        style: TextStyle(
                            fontWeight: kmedium, color: navyBlue, fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              hintText:
                                  "Passwords must be at least 8 characters",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),

                      Text(
                        "NRIC:",
                        style: TextStyle(
                            fontWeight: kmedium, color: navyBlue, fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: TextFormField(
                          controller: _nricController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "SXXXXXXXA",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: blue,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),

                      Text(
                        "DOB:",
                        style: TextStyle(
                            fontWeight: kmedium, color: navyBlue, fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: TextFormField(
                          controller: _dobController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "DD/MM/YYYY",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: blue,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),

                      Text(
                        "Register as a:",
                        style: TextStyle(
                            fontWeight: kmedium, color: navyBlue, fontSize: 16),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Row(
                            children: [
                              Text(
                                "Doctor",
                                style: TextStyle(
                                    fontWeight: kmedium,
                                    color: blue,
                                    fontSize: 16),
                              ),
                              Checkbox(
                                value: _doctorCheck,
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (_patientCheck) {
                                      _patientCheck = !_patientCheck;
                                    }
                                    _doctorCheck = value ?? false;
                                  });
                                },
                              ),
                              Text(
                                "Patient",
                                style: TextStyle(
                                    fontWeight: kmedium,
                                    color: blue,
                                    fontSize: 16),
                              ),
                              Checkbox(
                                value: _patientCheck,
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (_doctorCheck) {
                                      _doctorCheck = !_doctorCheck;
                                    }
                                    _patientCheck = value ?? false;
                                  });
                                },
                              ),
                            ],
                          )),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            Auth auth = Auth();

                            String first = _firstNameController.value.text;
                            String last = _lastNameController.value.text;
                            String nric = _nricController.value.text;
                            String email = _emailController.value.text;
                            String password = _passwordController.value.text;
                            DateTime dob = DateFormat("yMd")
                                .parse(_dobController.value.text);

                            String unixDOB =
                                dob.millisecondsSinceEpoch.toString();
                            String type = _patientCheck ? "patient" : "doctor";
                            bool shouldNavigate = await auth.register(
                                type: type,
                                last: last,
                                first: first,
                                nric: nric,
                                email: email,
                                password: password,
                                dob: unixDOB);
                            if (shouldNavigate) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: blue,
                              minimumSize: Size(width, 48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                            onPressed: widget.login,
                            child: Text(
                              "Login instead",
                              style: TextStyle(fontSize: 16.0),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
