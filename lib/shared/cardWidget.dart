import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.image,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),

        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,right: 10,left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(image, height: 50),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}