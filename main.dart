import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(

      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
var  changeContainer = true;
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> curvedAnimation;
  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    _animationController.repeat();
    curvedAnimation = CurvedAnimation(
        parent:_animationController , curve: Curves.elasticOut);

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: Tween<double> (begin: 0, end: 1 ).animate(curvedAnimation),
                child: Image.network('https://miro.medium.com/max/1838/1*Rj0MJbE-gRj3gmUTwSkKog.jpeg',
                height: 400,
                  width: 300,
                ),
              ),
              RotationTransition(
                turns: Tween<double> (begin: 0, end: 1).animate(curvedAnimation),
                child: Icon(
                  Icons.star,
                  size: 100,
                  color: Colors.pink,
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}