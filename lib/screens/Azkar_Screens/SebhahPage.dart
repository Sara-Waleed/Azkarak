import 'package:flutter/material.dart';

class SebhahPage extends StatefulWidget {
  const SebhahPage({Key? key}) : super(key: key);

  @override
  State<SebhahPage> createState() => _SebhahPageState();
}

class _SebhahPageState extends State<SebhahPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: Text("السبحة الالكترونية"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset("assets/images/main.jpg", height: double.infinity, fit: BoxFit.fill),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(75),
                      ),
                    ),
                    CircularProgressIndicator(
                      value: 0.5, // Set the initial value as needed
                      strokeWidth: 10,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          count++;
                        });
                      },
                      borderRadius: BorderRadius.circular(75),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(75),
                        ),
                        child: Center(
                          child: Text(
                            "$count",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.repeat_rounded),
                    ),
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
