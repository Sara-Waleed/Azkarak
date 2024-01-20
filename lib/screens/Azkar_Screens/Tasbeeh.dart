import 'package:Azkarak/models/tasbeehItem.dart';
import 'package:flutter/material.dart';




class TasbeehScreen extends StatelessWidget {
  final List<ComponentTasbeeh>tasbeeh=[
    ComponentTasbeeh(tasbeehText: 'سبحان الله', tasbeehCount: 0),
    ComponentTasbeeh(tasbeehText: 'الحمد لله', tasbeehCount: 0),
    ComponentTasbeeh(tasbeehText: 'لا إله إلا الله', tasbeehCount: 0),
    ComponentTasbeeh(tasbeehText: 'الله أكبر', tasbeehCount: 0),
    ComponentTasbeeh(tasbeehText: 'لا حول ولا قوة إلا بالله العلي العظيم', tasbeehCount: 0),
    ComponentTasbeeh(tasbeehText: ' أستغفر الله العظيم', tasbeehCount: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,
        title: Text("Morning Reminders"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main.jpg"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: tasbeeh.length,
                itemBuilder: (context, index) {
                  return AzkarContainer(
                    componentTasbeeh: tasbeeh[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
class AzkarContainer extends StatefulWidget {
  final ComponentTasbeeh componentTasbeeh;

  AzkarContainer({required this.componentTasbeeh});

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
                    primary: Colors.green,
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
