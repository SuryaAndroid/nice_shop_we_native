import 'package:flutter/material.dart';

class Dialogs{

  void showLoader(BuildContext context){

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            content: Row(
              children: [
                CircularProgressIndicator(),
                Text('   Please wait...')
              ],
            ),
          );
        }
    );

  }

}