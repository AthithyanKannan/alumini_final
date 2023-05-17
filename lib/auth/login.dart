import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/update_screens/update_profile.dart';


  TextEditingController _emailcontroller =  TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

 Future signin() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _rollnocontroller.text.trim());
    }

    void dispose() {
      _emailcontroller.dispose();
      _rollnocontroller.dispose();
      super.dispose();
    }
  TextEditingController _rollnocontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 40, 49, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1.0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                 CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/logo symbol.png'),
                  backgroundColor:  Color.fromRGBO(34, 40, 49, 1.0),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 27),
                  ),
                  const SizedBox(height: 2),
                   const Text(
                    "Please Login to continue",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                 UpdateTextBox('Enter your name', _emailcontroller, TextInputType.emailAddress),
                  const SizedBox(
                    height: 15,
                  ),
                  UpdateTextBox("Enter your roll_no", _rollnocontroller, TextInputType.name),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () {
                          signin();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UpdateScreen(),
                                ),
                                (route) => false);
                        
                      }, 
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 15)),
                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(217, 217, 217, 1.0)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 90, vertical: 15)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                            child: const Text(
                        'Login',
                         style: TextStyle(
                          color: Colors.black
                         ),
                      ),
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
   Widget UpdateTextBox(
      String hint, TextEditingController controller, TextInputType type) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 1.0),
          borderRadius: BorderRadius.circular(12)),
      height: 50,
      child: TextFormField(
        keyboardType: type,
        cursorColor: Colors.black,
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }
}