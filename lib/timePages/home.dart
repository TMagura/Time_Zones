
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
_HomeState createState()=>_HomeState(); 

}
class _HomeState extends State<Home>{

  Map data = {}; // create an empty map that will be filled later on 
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    print(data.toString());
     String bgImage = data['isDayTime'] ? 'day.jpg':'night.jpg';
    Color bgColor = data['isDayTime'] ? Color.fromARGB(255, 138, 191, 235): Color.fromARGB(255, 10, 0, 32); 
    Color textColor = data['isDayTime'] ?Color.fromARGB(255, 10, 0, 32): Colors.white ; 
    return Scaffold(
      backgroundColor: bgColor,
     body:
       Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/$bgImage'),
          fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
          child: Column(
          children:[
              TextButton.icon(
                icon: Icon(Icons.edit_location), 
                  onPressed: () async {
                    ///in this case we going to the location page and back at once(becoz we used pop Nav) 
                 dynamic results = await Navigator.pushNamed(context, '/choose_location');
                   setState(() {
                     data = {
                      'time':results['time'],
                      'location':results['location'],
                      'isDayTime':results['isDayTime'],
                      'flag':results['flag']
                     };
                   });
                  },
                  label: Text('choose location',
                  style: TextStyle(
              color: textColor),
                 ), 
              ),
            SizedBox(height: 20.0),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              Text(
                data['location'],
                style: TextStyle(fontSize: 20.0,letterSpacing: 2.0,fontWeight: FontWeight.bold,color: textColor),
                ),                         
              ]
            ),
            SizedBox(height: 30.0),
            Text(
                data['time'],
                style: TextStyle(fontSize: 50.0,letterSpacing: 2.0,fontWeight: FontWeight.bold, color: textColor),
                ),
          ]
          ),
        ),
      ),
      
    )  
    ;}
}