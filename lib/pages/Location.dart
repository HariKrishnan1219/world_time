import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(location: 'London', url: 'Europe/London', flag: 'uk.png'),
    WorldTime(location: 'Berlin', url: 'Europe/Berlin', flag: 'greece.png'),
    WorldTime(location: 'Cairo', url: 'Africa/Cairo', flag: 'egypt.png'),
    WorldTime(location: 'Nairobi', url: 'Africa/Nairobi', flag: 'kenya.png'),
    WorldTime(location: 'Chicago', url: 'America/Chicago', flag: 'usa.png'),
    WorldTime(location: 'Seoul', url: 'Asia/Seoul', flag: 'south_korea.png'),
  ];
  void updateTime(index) async
  {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag' : instance.flag,
      'isDay' : instance.isDay,
      'time' : instance.time,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chose Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 2.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
      }),
    );
  }
}
