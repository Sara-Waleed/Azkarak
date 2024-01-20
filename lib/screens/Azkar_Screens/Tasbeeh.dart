import 'package:Azkarak/models/tasbeehItem.dart';
import 'package:flutter/material.dart';
import '../../shared/Tasbeeh_Container.dart';




class TasbeehScreen extends StatelessWidget {
  final List<ComponentTasbeeh>tasbeeh=[
    ComponentTasbeeh(tasbeehText: 'سبحان الله', tasbeehCount: 100),
    ComponentTasbeeh(tasbeehText: 'الحمد لله', tasbeehCount: 100),
    ComponentTasbeeh(tasbeehText: 'لا إله إلا الله', tasbeehCount: 100),
    ComponentTasbeeh(tasbeehText: 'الله أكبر', tasbeehCount: 100),
    ComponentTasbeeh(tasbeehText: 'لا حول ولا قوة إلا بالله العلي العظيم', tasbeehCount: 100),
    ComponentTasbeeh(tasbeehText: ' أستغفر الله العظيم', tasbeehCount: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade300,
        title: Text("تسبيح"),
        centerTitle: true,
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
                  return AzkarCont(
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

