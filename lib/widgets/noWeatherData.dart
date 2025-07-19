import 'package:flutter/material.dart';
import '../views/search_screen.dart';

class NoWeatherData extends StatelessWidget {
  const NoWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0,
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/cloudy.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              const Text(
                "Start by searching for a city to see the weather🌤️",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//// import '../views/search_screen.dart';
// class NoWeatherData extends StatelessWidget {
//   const NoWeatherData({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "Weather App",
//         ),
//         actions: [
//           Padding(
//               padding: EdgeInsets.only(right: 20),
//               child: IconButton(
//                 onPressed: (){
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context){
//                     return SearchScreen();
//                   },),);
//                 },
//                 icon: Icon(Icons.search),
//               )),
//         ],
//       ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image(image: AssetImage('images/nodata.jpg'),width: 400,height: 400,)
//               ],
//             ),
//           ),
//     );
//   }
// }
