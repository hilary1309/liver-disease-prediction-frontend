import 'package:flutter/material.dart';
//import 'package:ldp_prediction/utils/size.dart';
//import 'package:ldp_prediction/utils/sizeConfig.dart';
//import 'package:ldp_prediction/utils/text_style.dart';

class InfoScreen extends StatefulWidget {
 const InfoScreen({super.key});
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'How The Prediction App Works',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
         Padding(
          padding: EdgeInsets.all(30.0),
          child: Text(
            'Step 1: Make sure you have the image you want to scan on your device\n\n'
            'Step 2: Click on the Upload button to add the image you wish to scan\n\n'
            'Step 3: Once the image is selected it will be previewed \n\n' 
            'Step 4: Click the Upload button on the preview page to start the processing \n\n' 
            'Step 5: Once the processsing is done it will save the prediction data to the database \n\n' 
            'Step 6: Click the Home page to see all predictions.',

            style: TextStyle(
          fontSize: 22
            ),
          ),
         )
        ],
      ),
    );
  }
}