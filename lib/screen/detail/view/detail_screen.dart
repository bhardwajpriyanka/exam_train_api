import 'package:exam_train_api/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';



class detailScreen extends StatefulWidget {
  const detailScreen({Key? key}) : super(key: key);

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {

  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderFalse =
        Provider.of<HomeProvider>(context, listen: false);
    homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: homeProviderFalse!.weatherData(homeProviderTrue!.Name),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("${snapshot.error}");
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              HomeModel? homeModel = snapshot.data;
              return Stack(
                children: [

                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              alignment: Alignment.center,
                              child: Text(
                                "${HomeModel!} ",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Expanded(
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 15,
                                      left: 75,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, 'home');
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
