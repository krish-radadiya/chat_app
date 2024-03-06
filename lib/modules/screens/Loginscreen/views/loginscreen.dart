import 'package:flutter/material.dart';
import '../constans/mathod.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(
                5,
              ),
              padding: const EdgeInsets.all(
                20,
              ),
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/Virtual-Assistant_1-1.gif",
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(
                10,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                        ),
                      ),
                      hintText: "enter email...",
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(
                            0xFFD7E4C0,
                          ),
                        ),
                      ),
                      hintText: "enter password...",
                      labelText: 'password',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.black,
                        // Color(
                        //   0xFFE1F0DA,
                        // ),
                      ),
                      foregroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                      minimumSize: MaterialStatePropertyAll(
                        Size(
                          320,
                          50,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'home',
                      );
                    },
                    child: const Text(
                      "Login",
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.orange,
                      ),
                      foregroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                      minimumSize: MaterialStatePropertyAll(
                        Size(
                          320,
                          50,
                        ),
                      ),
                    ),
                    onPressed: anonymous,
                    child: Text(
                      "sign in Anonymous",
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  // ElevatedButton(
                  //   style: const ButtonStyle(
                  //     backgroundColor: MaterialStatePropertyAll(
                  //       Colors.cyan,
                  //
                  //       // Color(
                  //       //   0xFFBFD8AF,
                  //       // ),
                  //     ),
                  //     foregroundColor: MaterialStatePropertyAll(
                  //       Colors.white,
                  //     ),
                  //     minimumSize: MaterialStatePropertyAll(
                  //       Size(
                  //         300,
                  //         50,
                  //       ),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: const Text(
                  //     "Sign up",
                  //   ),
                  // ),

                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.teal,
                        // Color(
                        //   0xFF99BC85,
                        // ),
                      ),
                      foregroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                      minimumSize: MaterialStatePropertyAll(
                        Size(
                          320,
                          50,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Sign in Google",
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            // Change to your desired color
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
