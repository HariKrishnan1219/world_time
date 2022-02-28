import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
  String bg_image = data['isDay']?'day.png':'night.png';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bg_image'),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(

            child :Column(

              children : <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(50.0, 160.0, 50.0, 0.0),
                  child: FlatButton.icon(
              onPressed: () async
          {
              dynamic result = await Navigator.pushNamed(context, '/location');
              setState(() {
                data =
                    {
                      'location' : result['location'],
                      'time' : result['time'],
                      'flag' : result['flag'],
                      'isDay': result['isDay'],
                    };
              });
          },
              icon: Icon(
                  Icons.edit_location,
                color: Colors.grey[400],
              ),
              label: Text(
                  'Choose Location',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 20.0,
              ),),
        ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.grey[200],
                    ),
                  ),
        ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                  ),
                ),
        ],
            )),
      ),
    );
  }
}
