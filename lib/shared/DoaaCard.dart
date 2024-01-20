import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/itemdoaa.dart';

class DoaaCard extends StatelessWidget {
  final ComponentDoaa doaa;

  DoaaCard({required this.doaa});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              doaa.doaaName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            doaa.doaaText,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}