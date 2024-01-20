import 'package:Azkarak/screens/Azkar_Screens/Evening_Reminder.dart';
import 'package:Azkarak/screens/Azkar_Screens/Morning_Reminders.dart';
import 'package:Azkarak/screens/Azkar_Screens/Sleep_Azkar.dart';
import 'package:Azkarak/screens/Azkar_Screens/Tasbeeh.dart';
import 'package:flutter/material.dart';

import '../../shared/BNBar.dart';
import '../../shared/cardWidget.dart';
import '../Azkar_Screens/SebhahPage.dart';
import '../Azkar_Screens/doaa.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  bool isFirstScreenVisible = true;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cardData = [

      {
        'image': 'assets/images/calendar.png',
        'onTap': () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MorningScreen(),));
        },
        'text': 'اذكار الصباح',
      },
      {
        'image': 'assets/images/night.png',
        'onTap': ()  {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EveningScreen(),));
        },
        'text': ' اذكار المساء ',
      },


      {
        'image': 'assets/images/sleep.png',
        'onTap': () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SleepAzkar(),));
        },
        'text': 'اذكار النوم ',
      },
      {
        'image': 'assets/images/pray.png',
        'onTap': ()  {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Doaa(),));
        },
        'text': 'دعاء',
      },
      {
        'image': 'assets/images/tasbih.png',
        'onTap': ()  {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TasbeehScreen(),));
        },
        'text': 'تسبيح',
      },
    ];

    return Scaffold(

      body: Stack(
        children: [
          Visibility(
            visible: isFirstScreenVisible,
            child: HomeBody(cardData: cardData), // Replace with your first screen widget
          ),
          Visibility(
            visible: !isFirstScreenVisible,
            child: SebhahPage(), // Replace with your second screen widget
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            isFirstScreenVisible = index == 0;
          });
        },
      ),
    );


  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.cardData,
  });

  final List<Map<String, dynamic>> cardData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text("اذكارك"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children:[

          Image.asset("assets/images/main.jpg",height:double.infinity,fit: BoxFit.fill,),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cardData.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> card = cardData[index];
                        return CardWidget(
                          image: card['image'],
                          onTap: card['onTap'],
                          text: card['text'],
                        );
                      },
                    ),
                  ),
                ],
              )
          ),


        ],
      ),
    );
  }
}





