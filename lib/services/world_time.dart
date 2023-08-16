import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

late String location;
late String time;
late String flag;
late String url;
late bool isDayTime;

/// Create a named constructor
 WorldTime({required this.location,required this.flag,required this.url,});
  
  
  Future<void> getData() async{

    try{
    ///Response has the Future return type
    ///Here we are geting data from the json placeholder API using http get,
    ///Uri.parse to able to use data it converts our data to String.
    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    ///A MAP is a collection with the key value parameters of the body of json data. 
    Map data = jsonDecode(response.body);
     String datetime = data['datetime'];
     String offset = data['utc_offset'].substring(1,3);
    
    /// create a datetime object 
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours:int.parse(offset)));
    /// change DateTime object back to String and use the intl dependecy.
    isDayTime = now.hour>6 && now.hour<20 ? true : false;
    time = DateFormat.jm().format(now);

    }catch(e){
      print('this is the error bro:$e');
      time = 'time cant be loaded';
    }
  }
  
}