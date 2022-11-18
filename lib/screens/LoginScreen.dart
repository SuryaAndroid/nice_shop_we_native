import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nice_shop_we_native/common/Dialogs.dart';
import 'package:nice_shop_we_native/navigation/navigations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var userNameCtrl = TextEditingController();
  var passCtrl = TextEditingController();

  //LOGICS
  //login user
  Future<void> logginTheUser() async{

    //http://p2h.in/live-shopping/sample1/api/user/login?email=&password=

    var pr = await SharedPreferences.getInstance();

    Dialogs().showLoader(context);

    try{

      http.Response response = await http.post(
        Uri.parse("http://p2h.in/live-shopping/sample1/api/user/login?email=${userNameCtrl.text}&password=${passCtrl.text}"),
      );

      if(response.statusCode==200){
        Navigator.pop(context);
        print(response.body);

        if(jsonDecode(response.body)['status']==true){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login Success",style: TextStyle(
                    color: Colors.green
                ),),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.white,
              )
          );
          pr.setString("dpImage", jsonDecode(response.body)['data']['user']['propic']);
          pr.setString("userName", jsonDecode(response.body)['data']['user']['full_name']);
          Navigator.pushNamed(context, RoutesName.DASHBOARD);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Invalid login data",style: TextStyle(
                    color: Colors.red
                ),),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.white,
              )
          );
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Unable to login.",style: TextStyle(
                  color: Colors.red
              ),),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.white,
            )
        );
        print(response.body);
        Navigator.pop(context);
      }

    }catch(e){
      print(e);
      Navigator.pop(context);
    }

  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Color(0xff120042),
          padding: EdgeInsets.all(height*0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Live Shop",style: TextStyle(
                  color: Colors.white,
                  fontSize: height*0.06,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),),
                SizedBox(height: height *0.02,),
                Text("LOGIN",style: TextStyle(
                  color: Colors.white,
                  fontSize: height*0.04,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: height *0.09,),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width*0.01,
                    //vertical: height*0.01
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    controller: userNameCtrl,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Username",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                    ),
                  ),
                ),
                SizedBox(height: height *0.04,),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width*0.01,
                    //vertical: height*0.01
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    controller: passCtrl,
                    obscuringCharacter: "*",
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height *0.04,),
                GestureDetector(
                  onTap: (){
                    if(userNameCtrl.text.isEmpty || passCtrl.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please Fill All Fields",style: TextStyle(
                            color: Colors.red
                          ),),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.white,
                        )
                      );
                    }else{
                      logginTheUser();
                    }
                  },
                  child: Container(
                    height:height*0.06,
                    width: width-100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("LOGIN",style: TextStyle(
                      color: Color(0xff120042),
                      fontWeight: FontWeight.bold,
                      fontSize: height*0.022
                    ),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
