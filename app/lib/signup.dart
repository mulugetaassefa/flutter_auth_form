import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/signin.dart';
import 'package:app/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  
  final _formKey = GlobalKey<FormState>();
    User user = User('', '');
  Future save() async {
    var res = await http.post(
      Uri.parse("http://10.4.96.50:6000/signup"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: <String, String>{
        'email': user.email,
        'password': user.password,
      },
    );
  
   print(res.body);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signin()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
     child: Stack(
        children: [
          Positioned(
            top: 0,
            child: SvgPicture.asset(
              'images/top.svg',
              width: 400,
              height: 130,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                const  SizedBox(
                    height: 150,
                  ),
                  Text(
                    "Signup",
                    style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.blue,
                    ),
                  ),
               const   SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.email),
                      onChanged: (value) {
                        user.email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter something';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        hintText: 'Enter Email',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:const BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.password),
                      onChanged: (value) {
                        user.password = value;
                      },
                      validator:(value) {
                        if (value!.isEmpty) {
                          return 'Enter something';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.vpn_key,
                          color: Colors.blue,
                        ),
                        hintText: 'Enter Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:const BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:const BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(55, 16, 16, 0),
                    child:  Container(
                      height: 40,
                      width: 400,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            save();
                          } else {
                           print("not ok");
                          }
                        },
                        child: const Text(
                          "Signup",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(95, 20, 0, 0),
                    child: Row(
                      children: [
                       const Text(
                          "Already have Account ? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signin(),
                              ),
                            );
                          },
                          child: const Text(
                            "Signin",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}