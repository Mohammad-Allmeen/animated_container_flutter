import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroAnimation extends StatefulWidget {
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation>
    with SingleTickerProviderStateMixin //with is used whenever we provide mixing class, mixin classes are similar to interface {
    {
var arrIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  late Animation animation; // feature of dart, it will initialized late
  late AnimationController animationController;
  late Animation colorAnimation; //to change the color while animation


  void initState(){
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 4) ); // it will synchronize and mix
    animation = Tween(begin: 0.0,end: 200.0).animate(animationController);   //take 2 values begin and end, controller will generate this value through single tick provider
    //animation = Tween(begin: 200.0,end: 0.0).animate(animationController);
    //animation = Tween(begin: 200.0,end: 100.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.black, end: Colors.green).animate(animationController); // ColorTween is assigned

    animationController.addListener((){
    //print(animation.value);
    setState(() {

    });
  });
  animationController.forward(); //to start the animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeroAnimation"),
      ),
      body: Container(
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(),
              // You can uncomment the Hero widget if needed for animation
              Hero(
                  tag: 'background',
                  child: Image.asset('Assets/Images/tree.jpg')
              ),

              // Wrapping ListWheelScrollView in Expanded to give it a finite height
              Expanded(
                child: ListWheelScrollView(
                  itemExtent: 100,
                  children: arrIndex.map((value) { return Padding(   //value is the element of arrIndex
                            padding: const EdgeInsets.all(8.0),
                            child: Container( // the above map function is returning container

                              width: 200,
                              child: Center(
                                  child: Text("$value",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white),
                              )),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue,
                                      offset: const Offset(
                                        5.0,5.0
                                      ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0
                                  )
                                ],
                              ),
                            ),
                  ); // function is returning the padding
                  })
                      .toList(),// toList - becuase we want to convert it into the list
                  // height of each item
                ),
              ),

              // TWEEN ANIMATION- start and end
              //there is a controller to control the animation, off, on, update etc, we will use set state in controller for updating in run time
              //mixing class- single tick provider with mixing

            Column(
              children: [
                Container(
                  width: animation.value,height: animation.value,
                  color: colorAnimation.value,
            ),

              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}
