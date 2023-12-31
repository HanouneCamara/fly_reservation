import 'package:flutter/material.dart';
import 'package:fly_reservation/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'hotel_screen.dart';
import 'search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
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
                    text: 'Votre Voyage',
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
          padding: const EdgeInsets.only(top: 60.0, left: 40.0, right: 40.0), 
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    AppConstants.appLogo,
                    width: 50,
                    height: 20,
                  ),
                  const Text(
                    'Vol',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 100),
                  const Icon(
                    FontAwesomeIcons.hotel,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HotelScreen()),
                      );
                    },
                    child: const Text(
                      'Hôtel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),  
              const Divider(
                color: AppConstants.primaryColor,
                thickness: 4.0,
                endIndent: 250,
              ),
              const SizedBox(height: 30),
              
              Container(
                decoration: BoxDecoration(
                  color: AppConstants.primaryColor, 
                  borderRadius: BorderRadius.circular(15.0),
                ),
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                  child: Row(
                    children: [
                    
                     Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'A partir de', labelStyle: TextStyle(color: Colors.white), hintText: 'London', hintStyle: TextStyle(color: Colors.white)),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Date', labelStyle: TextStyle(color: Colors.white), hintText: '6 Janvier 2024', hintStyle: TextStyle(color: Colors.white),),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Passagères', labelStyle: TextStyle(color: Colors.white), hintText: '1', hintStyle: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'A', labelStyle: TextStyle(color: Colors.white), hintText: 'Berlin', hintStyle: TextStyle(color: Colors.white)),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Type', labelStyle: TextStyle(color: Colors.white), hintText: 'One Way', hintStyle: TextStyle(color: Colors.white), suffixIcon: Icon(FontAwesomeIcons.chevronDown, color: Colors.white)),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(labelText:'Classe', labelStyle: TextStyle(color: Colors.white), hintText: 'Economy', hintStyle: TextStyle(color: Colors.white), suffixIcon: Icon(FontAwesomeIcons.chevronDown, color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 56),
              ElevatedButton(
                onPressed: (){
                  Get.to(SearchPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), 
                  ),
                ),
                child: const SizedBox(
                  width: 300, 
                  height: 55, 
                  child: Center(
                    child: Text(
                      'Recherche',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ), 
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
