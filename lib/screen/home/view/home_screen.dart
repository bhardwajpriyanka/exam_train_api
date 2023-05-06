import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

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
          appBar: AppBar(title: Text("Train Detail"),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  TextField(
                    controller: homeProviderFalse!.txtcityname,
                    decoration: InputDecoration(
                      hintText: "Search ",
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                      filled: true,
                      fillColor: Colors.black12,
                      focusColor: Colors.black12,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          width: 2,
                          color: Colors.black12,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      String name = homeProviderTrue!.txtcityname.text;

                      if(name.isNotEmpty){
                        print(name);
                        homeProviderFalse!.changeData(name);
                        Navigator.pop(context);
                      }
                      else{
                        homeProviderFalse!.changeData(homeProviderTrue!.Name);
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                        height: 50,
                        width: 175,
                        decoration: BoxDecoration(
                          border: Border.all(
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.add)
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
