import 'package:flutter/material.dart';

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
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(20),
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
              child: Column(
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
                          300,
                          50,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'home');
                    },
                    child: const Text(
                      "Login",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.orange,
                        // Color(
                        //   0xffD4E7C5,
                        // ),
                      ),
                      foregroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                      minimumSize: MaterialStatePropertyAll(
                        Size(
                          300,
                          50,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Login Anonymous",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.cyan,

                        // Color(
                        //   0xFFBFD8AF,
                        // ),
                      ),
                      foregroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                      minimumSize: MaterialStatePropertyAll(
                        Size(
                          300,
                          50,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Sign up",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
                          300,
                          50,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Sign with Google",
                    ),
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
