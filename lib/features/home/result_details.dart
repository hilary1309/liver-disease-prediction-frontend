import 'package:flutter/material.dart';
import 'package:ldp_prediction/core/model/fetch_result.dart';
import 'package:ldp_prediction/core/provider/user_provider.dart';
//import 'package:ldp_prediction/features/home/home_screen.dart';
import 'package:provider/provider.dart';

class ResultDetailScreen extends StatefulWidget {
  final PredictionElement details;
  //final FetchResultsModel details;
  const ResultDetailScreen({super.key, required this.details});

  @override
  State<ResultDetailScreen> createState() => _ResultDetailScreenState();
}

class _ResultDetailScreenState extends State<ResultDetailScreen> {
 UserProvider? userProv;
 
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userProv =
          Provider.of<UserProvider>(context, listen: false);
          userProv!.fetchResult();
    });
  }
  
  @override
  Widget build(BuildContext context) {

    
   return Scaffold(
  body: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                //  functionality to navigate back
                Navigator.of(context).pop();
              },
            
            ),
            const Text(
              'Prediction Result',
              style: TextStyle(
                fontSize: 30.0, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20), // Adjust spacing as needed
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image display section
            Container(
              width: double.infinity,
              height: 200, // Adjust height as needed
              decoration: BoxDecoration(
                image:  DecorationImage(
                  image: NetworkImage(
                    //'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Human_liver_with_metastatic_lesions_from_primary_pancreas_carcinoma_%282%29.jpg/640px-Human_liver_with_metastatic_lesions_from_primary_pancreas_carcinoma_%282%29.jpg', // Replace with image URL
                    "${widget.details.imageUrl}"
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius
              ),
            ),
            const SizedBox(height: 20), // Add spacing between image and text
            Text(
              "Prediction Name: Liver Disease Scan\n\n"
              "TimeStamp:   ${widget.details.timestamp}\n\n",
              style: const TextStyle(fontSize: 18.0), // Increased font size
            ),
           Text(
              'Liver Condition: ${widget.details.highestConfidenceClass} \n\n'
              'Highest Confidence Score: ${widget.details.highestConfidenceScore} \n\n'
             // 'Prediction Suggestion: ${widget.details.suggestions?.elementAt(0)}\n\n',
             'Prediction Suggestion: ${widget.details.suggestions}\n\n',
              
              style: const TextStyle(fontSize: 18.0), // Increased font size
            ),
          ],
        ),
      ),
    ],
  ),
);
  }
}