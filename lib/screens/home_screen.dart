import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
          ),
          child: Column(children: [
            SizedBox(
              height: height * 0.01,
            ),
            Container(
                margin: EdgeInsets.only(left: width * 0.03),
                child: Text("NEWS",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              height: 1,
              color: Colors.grey,
              width: width,
              margin: EdgeInsets.only(left: width * 0.01),
            )
          ]),
        ),
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: height * 0.08),
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(0, 2),
                          spreadRadius: 1,
                        )
                      ]),
                  height: height * 0.15,
                  margin: EdgeInsets.only(
                      bottom: height * 0.02, top: height * 0.02),
                  child: Row(
                    children: [],
                  ));
            },
          ),
        )
      ])),
    );
  }
}
