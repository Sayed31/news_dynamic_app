import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories.dart';
import 'package:news_app/Funs/funs.dart';

import 'Constants.dart';
import 'api.dart';
class category extends StatefulWidget {
String? categoryy;
category(this.categoryy);



  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  api Api = api();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 50,
                bottom: 10
            ),
            child: Text("US News",
              style: TextStyle(
                  color: textColor,
                  fontSize: fontBiggest,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                   categoryButton("General",orangeLight,"general"),
                  categoryButton("Health",red,"health"),
                  categoryButton("Science",orangeDark,"science"),
                  categoryButton("Business",green,"business"),
                  categoryButton("Sports",blue,"sports"),
                  categoryButton("Entertainment",textColor,"entertainment"),
                  categoryButton("Technology",yellow,"technology"),

                ],
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0,right: 20,left: 20,),
            child: Text("Trends",
              style: TextStyle(
                fontSize: fontSubTitle,
                color: textColor,
                fontWeight: FontWeight.bold,


              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: Api.getNewsByCategory("${widget.categoryy}"),
              builder: (context, AsyncSnapshot snapshot) {
                if(snapshot.data==null)
                {
                  return
                    Center(
                      child: CircularProgressIndicator(
                      backgroundColor: backGround,
                      valueColor: AlwaysStoppedAnimation(
                          red
                      ),
                  ),
                    );
                }
                else{
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,i)
                      {
                        return Padding(

                          padding: const EdgeInsets.only(right: 25.0,left: 25,bottom: 5,top: 5),
                          child: GestureDetector(
                            onTap: (){
                              funs.openInBrowser("${snapshot.data[i].url}");
                            },
                            child: Card(
                              elevation: 5,
                              shadowColor:Colors.black,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(

                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover, image: NetworkImage((snapshot.data[i].urlToImage==null)?"https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png":"${snapshot.data[i].urlToImage}")
                                        ),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0)),

                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${snapshot.data[i].title}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(onPressed: (){
                                          funs.shareLink("${snapshot.data[i].url}");
                                        },
                                          icon: Icon(Icons.share),color: Colors.black.withOpacity(0.5),),
                                        IconButton(onPressed: (){
                                          funs.copyLink("${snapshot.data[i].url}");
                                          final snackBar = SnackBar(content: Text('Copied to clipboard!'));
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                        },
                                          icon: Icon(Icons.copy),color: Colors.black.withOpacity(0.5),),

                                      ],
                                    )


                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                  );

                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
