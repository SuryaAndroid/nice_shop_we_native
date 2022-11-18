import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  var dpImage = "";
  var userName = "";

  //LOGICS
  Future<void> getData() async {
    var pr = await SharedPreferences.getInstance();
    setState(() {
      dpImage = pr.getString("dpImage")??'';
      userName = pr.getString("userName")??'';
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      getData();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff120042),
        title: Text(
          "User Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        height: height * 0.91,
        width: width,
        padding: EdgeInsets.all(height*0.02),
        color: Color(0xff120042),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: width*0.07,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: width*0.067,
                            backgroundImage: NetworkImage(dpImage),
                          ),
                        ),
                        // Positioned(
                        //   bottom: 5,
                        //   right: 10,
                        //   child: Container(
                        //     padding: EdgeInsets.all(10),
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       shape: BoxShape.circle
                        //     ),
                        //     child: Icon(Icons.edit,color: Colors.red,size: height*0.025,),
                        //   ),
                        // )
                      ],
                    ),
                    Expanded(child:Padding(
                      padding: EdgeInsets.all(width*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('23.6',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width*0.04,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text('Praised',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: width*0.03,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('23k',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width*0.04,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text('Follow',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: width*0.03,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('23k',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width*0.04,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text('Fans',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: width*0.03,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(height: height*0.04,),
              Container(
                child: Row(
                  children: [
                    Expanded(child:Padding(
                      padding: EdgeInsets.all(width*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(userName,style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width*0.04,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text('22 years old',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: width*0.03,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Location',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width*0.04,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text('Ooty',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: width*0.03,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Gender',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width*0.04,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text('Male',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: width*0.03,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ],
                      ),
                    )),
                    Icon(Icons.chat,size: width*0.075,color: Colors.white,)
                  ],
                ),
              ),
              SizedBox(height: height*0.04,),
              Text("POPULAR",style: TextStyle(
                color: Colors.white,
                fontSize:height*0.022
              ),),
              Container(
                height: height*0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (c,i){
                    return Container(
                      width: width*0.4,
                      margin: EdgeInsets.all(height*0.015),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage("https://m.media-amazon.com/images/I/61yBCMmuI4L._UL1440_.jpg"),
                          fit: BoxFit.cover
                        )
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height*0.04,),
              Text("NEW",style: TextStyle(
                  color: Colors.white,
                  fontSize:height*0.022
              ),),
              Container(
                height: height*0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (c,i){
                    return Container(
                      width: width*0.4,
                      margin: EdgeInsets.all(height*0.015),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage("https://contents.mediadecathlon.com/p1772203/cfdc5f2e3d61aca087d99dddeffd3040/p1772203.jpg?format=auto&quality=70&f=650x0"),
                            fit: BoxFit.cover
                          )
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
