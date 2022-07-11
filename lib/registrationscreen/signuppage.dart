import 'package:animalinformation/registrationscreen/signinpage.dart';
import 'package:animalinformation/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool ispasswordvisible = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 30, top: 50),
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.cormorantGaramond(
                        textStyle: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const SizedBox(
                      height: 70,
                      width: 325,
                      child: TextField(
                        obscureText: false,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white54,
                          ),
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      )),
                  const SizedBox(height: 30),
                  const SizedBox(
                      height: 70,
                      width: 325,
                      child: TextField(
                        obscureText: false,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white54,
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      )),
                  const SizedBox(height: 30),
                  SizedBox(
                      height: 70,
                      width: 325,
                      child: TextField(
                        cursorColor: Colors.white,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 17),
                        obscureText: ispasswordvisible,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white54,
                          ),
                          suffixIcon: IconButton(
                            icon: ispasswordvisible
                                ? const Icon(
                                    Icons.visibility_off,
                                    size: 20,
                                    color: Colors.white54,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    size: 20,
                                    color: Colors.white54,
                                  ),
                            onPressed: () => setState(
                                () => ispasswordvisible = !ispasswordvisible),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  const SizedBox(height: 30),
                  SizedBox(
                      height: 70,
                      width: 325,
                      child: TextField(
                        cursorColor: Colors.white,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 17),
                        obscureText: ispasswordvisible,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white54,
                          ),
                          suffixIcon: IconButton(
                            icon: ispasswordvisible
                                ? const Icon(
                                    Icons.visibility_off,
                                    size: 20,
                                    color: Colors.white54,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    size: 20,
                                    color: Colors.white54,
                                  ),
                            onPressed: () => setState(
                                () => ispasswordvisible = !ispasswordvisible),
                          ),
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  const SizedBox(height: 25),
                  Container(
                    width: 325,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white),
                      color: Colors.black45,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignInpage();
                        }));
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an Account?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignInpage();
                          }));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
