import 'package:flutter/material.dart';
import 'package:fly_reservation/constants.dart';
import 'package:fly_reservation/screens/vol_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);

  @override
  HotelScreenState createState() => HotelScreenState();
}

class HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.primaryColor,
          title: Center(
            child: RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Choisissez ',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  TextSpan(
                    text: 'Votre Hôtel',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          toolbarHeight: 100.0,
        ),
        
        body: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 40.0), // Ajustez la valeur selon vos besoins
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    AppConstants.appLogo,
                    width: 50,
                    height: 20,
                    color: Colors.grey,
                  ),
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                      );
                    },
                    child: const Text(
                      'Vol',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 100),
                  const Icon(
                    FontAwesomeIcons.hotel,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'Hôtel',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),  // Espacement entre le texte "Vol" et le Divider
              const Padding(
                padding: EdgeInsets.only(right:90.0),
                child: Divider(
                  color: AppConstants.primaryColor,
                  thickness: 4.0,
                  indent: 180,
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    "Liste d'hôtels",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
             
          ),
          
        ),
        
      ),
    );
  }
}
