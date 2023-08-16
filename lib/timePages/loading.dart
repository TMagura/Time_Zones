import 'package:flutter/material.dart';
import 'package:practice/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget{
  @override
_LoadingState createState()=>_LoadingState(); 

}
class _LoadingState extends State<Loading>{

  void setupWorldtime() async{
    WorldTime worldt = WorldTime(location:'Zimbabwe', flag: 'zimbabwe.jpg', url: 'Africa/Harare');
    await worldt.getData(); 
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':worldt.location,
      'flag':worldt.flag,
      'time':worldt.time,
      'isDayTime':worldt.isDayTime
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldtime();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child:SpinKitSpinningLines(
            color: Color.fromARGB(255, 214, 38, 141),
            size: 150.0,
          ),
        ),
    )  
    ;}
}