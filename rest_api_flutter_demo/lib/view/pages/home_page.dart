import 'package:flutter/material.dart';
import 'package:rest_api_flutter_demo/model/pincode.dart';

class HomePage extends StatelessWidget {
  final Pincode pincode;
  const HomePage({super.key, required this.pincode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 224, 201, 156)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(pincode.message),
                // Text(pincode.status),
                SizedBox(
                  height: 200,
                  width: 300,
                  child: ListView.builder(
                    itemCount: pincode.postOffice.length,
                    itemBuilder: (ctx, i) => Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Name: ${pincode.postOffice[i].name}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'BranchType: ${pincode.postOffice[i].branchType}')),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              'DeliveryStatus: ${pincode.postOffice[i].deliveryStatus}'),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Circle: ${pincode.postOffice[i].circle}')),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'District: ${pincode.postOffice[i].district}')),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Division: ${pincode.postOffice[i].division}')),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Region: ${pincode.postOffice[i].region}')),
                        Align(
                            alignment: Alignment.topLeft,
                            child:
                                Text('Block: ${pincode.postOffice[i].block}')),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Country: ${pincode.postOffice[i].country}')),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Pincode: ${pincode.postOffice[i].pincode}')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
