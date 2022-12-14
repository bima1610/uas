import 'package:flutter/material.dart';
import 'package:uas/home.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
// import 'package:uts/drawer_page.dart';

class loginPage extends StatefulWidget {
  @override
  State<loginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<loginPage> {
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  void login(String email, password) async {
    try {
      // ME-GET atau Mengambil data json dari link
      var response = await Dio().get('http://localhost:3000/user');
      // var response = await http.get(Uri.parse('http://localhost/uas_mobile/server_user.php'));
      // var response = await Dio().get('http://10.0.2.2:3000/users');
      // inisialisasi panjang data
      var panjang_data = response.data.length;
      if (response.statusCode == 200) {
        // pengecekan dengan perulangan dan percabangan,
        // input akan dicek dari semua data yg sudah ada di json
        for (var i = 0; i <= panjang_data; i++) {
          if (email == response.data[i]['email'] &&
              password == response.data[i]['password']) {
            print("Login success");
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
            break;

          }
        }
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Login failed 1',
            // style: GoogleFonts.lexend(
            //   fontWeight: FontWeight.normal,
            //   fontStyle: FontStyle.normal,
            //   color: Colors.white,
            // ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          'Login failed 2',
          // e.toString(),
          // style: GoogleFonts.lexend(
          //   fontWeight: FontWeight.normal,
          //   fontStyle: FontStyle.normal,
          //   color: Colors.white,
          // ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(50),
                // child: Image.network('https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
                  child: Icon(Icons.add_home_work_outlined, size: 200, color: Colors.white,
                  // scale: 2,
                ),
              ),
              _formBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formBuilder(){
    final ButtonStyle style = ElevatedButton.styleFrom(backgroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 20),);
    return Form(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: controllerEmail,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 10)
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: controllerPass,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5),),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ElevatedButton(
            // onPressed: () {
            //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
            // },
            onPressed: () {
              login(controllerEmail.text, controllerPass.text);
            },
            style: style,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Center(
                child: Text('Login', style: TextStyle(
                    fontSize: 24,
                    color: Colors.greenAccent
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}