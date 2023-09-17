import 'package:flutter/material.dart';

import '../views/search_screen.dart';
class NoWeatherData extends StatelessWidget {
  const NoWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Weather App",
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return SearchScreen();
                  },),);
                },
                icon: Icon(Icons.search),
              )),
        ],
      ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/nodata.jpg'),width: 400,height: 400,)
              ],
            ),
          ),
    );
  }
}
