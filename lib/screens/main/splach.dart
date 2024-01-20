import 'package:Azkarak/screens/main/Home.dart';
import 'package:flutter/material.dart';

class Splach extends StatelessWidget {
  const Splach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/splach.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("اسلاميات",style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 35
              ),),
              SizedBox(height: 20,),
              Image.asset("assets/images/pray.png",
                height: 250,),
              SizedBox(height: 50,),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow
                  ),
                    onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder:
                          (context) => Home(),));
                    },
                    child: Text("Welcom",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                    ),)),
              ),
            ],
          ),


        ],
      ),

    );
  }
}
