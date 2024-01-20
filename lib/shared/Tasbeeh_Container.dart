import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/tasbeehItem.dart';

class AzkarCont extends StatefulWidget {
  final ComponentTasbeeh componentTasbeeh;

  AzkarCont({required this.componentTasbeeh});

  @override
  _AzkarContainerState createState() => _AzkarContainerState();
}

class _AzkarContainerState extends State<AzkarCont> {
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
              ' ${widget.componentTasbeeh.tasbeehText}',
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
                    primary:Colors.blue.shade300,
                  ),
                  onPressed: () {
                    setState(() {
                      pressCount++;

                      // Check if pressCount exceeds tasbeehCount
                      if (pressCount >= widget.componentTasbeeh.tasbeehCount) {
                        pressCount = 0; // Reset the count
                        progressValue = 0.0; // Reset the progress
                      } else {
                        progressValue = pressCount / widget.componentTasbeeh.tasbeehCount;
                      }
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0,left: 10,top: 10,bottom: 10),
                        child: Text(
                          '$pressCount', // Update the text based on pressCount
                          style: TextStyle(fontSize: 16),
                        ),
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