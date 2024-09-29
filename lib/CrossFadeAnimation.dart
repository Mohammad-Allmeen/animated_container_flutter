
import 'dart:async';
import 'package:animated_container/RippleAnimation.dart';
import 'package:animated_container/HeroAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
class CrossFadeAnimation extends StatefulWidget
{
  @override
  State<CrossFadeAnimation> createState()=> _CrossFadeState();
}

class _CrossFadeState extends State<CrossFadeAnimation>{

  bool isFirst = true;
  @override

  // void initState(){
  //   super.initState();
  //   Timer(Duration(seconds: 4),()
  //   {
  //     reload();
  //   }
  //   );
  // }
  void reload()
  {
    setState(() {
      if(isFirst) {
        isFirst = false;
      }
      else
        {
          isFirst= true;
        }
    });
  }

  Widget build (BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cross Fade Animation Page"),
      ),
      body:
         Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               AnimatedCrossFade(
                duration: Duration(seconds: 4),
                 firstChild: Container(
                   width: 200,
                   height: 200,
                   color: Colors.blueAccent,
                 ),
                  secondChild: Image.asset("Assets/Images/tree.jpg",
                  width: 300,
                    height: 300,
                  ),
                 sizeCurve: Curves.bounceIn, //this is applies when there is difference in size of first child and the second child
                 firstCurve: Curves.elasticInOut,
                 secondCurve: Curves.fastOutSlowIn,

                 //crossFadeState: CrossFadeState.showSecond, // this will define which child will be shown first
                 crossFadeState: isFirst ? CrossFadeState.showFirst: CrossFadeState.showSecond, //toggling when true show first when false show second through init State


                 // Container(
                 // child: CircleAvatar(
                 //   backgroundImage: AssetImage("Assets/Images/tree.jpg"),
                 // ),
                 // ),
               ),

               ElevatedButton(onPressed: (){

                setState(() {
                reload();
                });
               }, child: Text("Change State"),
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.black,
                 elevation: 10,
                 shadowColor: Colors.black,
                 textStyle: TextStyle(color: Colors.white,fontSize: 15, fontStyle: FontStyle.italic, fontWeight: FontWeight.w700)
               ),
               ),
               
               Column(
                 children: [
                   InkWell(
                     onTap: (){
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context)=>HeroAnimation()
                       )
                       );
                     },
                     child: Hero(tag: 'background',  //tag will link the image to the next page
                         child: Image.asset("Assets/Images/tree.jpg", width: 100, height: 100,)
                     ),
                   ),
                   ElevatedButton(onPressed: (){
                     Navigator.push(context,
                       MaterialPageRoute(builder: (context)=>RippleAnimation()
                       ),
                     );
                   }, child: Text( "Ripple Page", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                   ),
                 ],
               )
             ],
           ),
         ),

    );
  }
}