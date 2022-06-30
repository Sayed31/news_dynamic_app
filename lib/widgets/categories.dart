import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/category.dart';
class categoryButton extends StatelessWidget {
  String? categoryName;
  Color? buttonColor;
  String? categories;
  categoryButton(this.categoryName,this.buttonColor,this.categories);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: RaisedButton(


          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>category("${categories}")));

          },
        child: Text("${categoryName}",
        style: TextStyle(
          color: Colors.white,



        ),

        ),
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),

      ),
    );
  }
}
