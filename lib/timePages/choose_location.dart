import 'package:flutter/material.dart';
import 'package:practice/services/world_time.dart';
class ChooseLocation extends StatefulWidget{
  @override
_ChooseLocationState createState()=>_ChooseLocationState(); 

}
class _ChooseLocationState extends State<ChooseLocation>{

  /// Create the list of instances of a WorldTime class
    List<WorldTime> locations =[
         WorldTime(url:'Africa/Harare' ,location:'Zimbabwe',flag:'Zimbabwe.jpg' ),
         WorldTime(url:'Africa/Gaborone' ,location:'Botswana',flag:'South_Africa.jpg'),
         WorldTime(url:'Africa/Cairo' ,location:'Egypt',flag:'Morocco.jpg' ),
         WorldTime(url:'Africa/Luanda' ,location:'Angola',flag:'Angola.jpg' ),
         WorldTime(url:'Africa/Tripoli' ,location:'Lybia',flag:'Lybia.jpg' ),
         WorldTime(url:'Africa/Tripoli' ,location:'Lybia',flag:'Lybia.jpg' )
    ];
   
   /// method which will update the data that comes from tapping the card in ListTile.
    void updateTime(index)async{
       WorldTime instance = locations[index];
       await instance.getData();
       /// get data and go back to home screen
       Navigator.pop(context,{
        'location':instance.location,
        'isDayTime':instance.isDayTime,
        'time':instance.time,
        'flag':instance.flag
       });
    } 

  @override
  Widget build(BuildContext context) {
    print("this is the build state");
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
        backgroundColor: Colors.black12,
        centerTitle: true,
        ), 
        body:ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(backgroundImage:AssetImage('assets/${locations[index].flag}'), ), 
                  title: Text(locations[index].location),
                  onTap: () {
                    updateTime(index);
                    // print(locations[index].flag,);
                  },
                ),
              ),
            );
          }),  
       )  
    ;}
}