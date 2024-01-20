
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ItemAzkar.dart';

class AzkarContainer extends StatefulWidget {
  final ComponentAzkar componentAzkar;

  AzkarContainer({required this.componentAzkar});

  @override
  _AzkarContainerState createState() => _AzkarContainerState();
}
class _AzkarContainerState extends State<AzkarContainer> {
  double progressValue = 0.0;
  int pressCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              ' ${widget.componentAzkar.Textquran}',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(24), // Adjust the padding to increase button size
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      pressCount++;

                      // Check if pressCount exceeds countertime
                      if (pressCount >= widget.componentAzkar.countertime) {
                        pressCount = 0; // Reset the count
                        progressValue = 0.0; // Reset the progress
                      } else {
                        progressValue = pressCount / widget.componentAzkar.countertime;
                      }
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        '$pressCount', // Update the text based on pressCount
                        style: TextStyle(fontSize: 16),
                      ),
                      Positioned.fill(
                        child: CircularProgressIndicator(
                          value: progressValue,
                          strokeWidth: 4,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}