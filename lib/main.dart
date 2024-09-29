import 'package:animated_container/CrossFadeAnimation.dart';
import 'package:flutter/material.dart';
import 'CrossFadeAnimation.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _width =200.0;//  '_' is used for creating private variable
  var _height = 100.0;
  bool flag = true; // for toggling the container
  var myOpacity = 1.0;
  var isVisible = true;


  Decoration myDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(3),
        color: Colors.grey
  );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
                height: _width,
            width: _height,
                curve: Curves.fastOutSlowIn,// Curve is used to change the rate of change of animation
                // fastoutslowin - in indicates start and out indicated end, means it will start slow and end fast, many more animation speed is present
                decoration: myDecor,
                duration: Duration(seconds: 3)

            ),
            ElevatedButton(onPressed: (){
              setState(() {
                if (flag)
                  {
                    _width=100.0;
                    _height = 200.0;
                    flag=false;  //this is called toggling
                    myDecor= BoxDecoration(
                      color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                    );
                  }
                else
                  {
                    _width= 200.0;
                    _height=100.0;
                    flag=true; //toggling
                    myDecor = BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow
                    );
                  }
              });
            }, child: Text('Animate')),

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ANIMATED OPACITY - If it is visible then ALPHA value is 1.0
                  // IF it is invisile then ALPHA value is 0.0
                  // basically it is used for changing the visibility
                  AnimatedOpacity(opacity: myOpacity,
                    duration: Duration(seconds: 2),
                    curve:Curves.elasticInOut,
                 child: Container(
                    width: 200,
                    height: 100,
                   decoration: BoxDecoration(
                     color: Colors.blueAccent,
                     borderRadius: BorderRadius.circular(12),
                   ),
              ),
                  ),
                  ElevatedButton(onPressed: (){
                    if (isVisible) {
                      myOpacity = 0.0;// when button is presses the opacity will become 0, and container will be hidden
                      isVisible=false;
                    }
                    else
                      {
                        myOpacity=1.0;
                        isVisible=true;
                      }
                      setState(() {

                    });
                  }, child: Text("Check")),

                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> CrossFadeAnimation())
                  );
                }, child: Text("Change"))

                ],
              ),
            )
          ],
        ),
      )

    );
  }
}




