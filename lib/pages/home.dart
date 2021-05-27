import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgUrl = data['isDayTime']
        ? "https://images.unsplash.com/photo-1548268770-66184a21657e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MzZ8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80"
        : "https://wallpapercave.com/wp/wp5339453.jpg";

    Color statusBarCol = data['isDayTime'] ? Color(0xFF0B8589) : Colors.black54;

    return Scaffold(
      backgroundColor: statusBarCol,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(bgUrl), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'flag': result['flag'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit, color: Colors.white),
                    label: Text("set location",
                        style: TextStyle(color: Colors.white))),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                        style: TextStyle(fontSize: 28, color: Colors.white)),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(data['time'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
