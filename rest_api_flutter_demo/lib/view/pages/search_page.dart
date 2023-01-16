import 'package:flutter/material.dart';
import 'package:rest_api_flutter_demo/controller/pincode_controller.dart';
import 'package:rest_api_flutter_demo/view/pages/home_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _serachController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  PincodeController pincodeController = PincodeController();

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _serachController,
                    decoration: InputDecoration(
                      labelText: "Enter PinCode",
                      hintText: '700156',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(),
                      ),
                      //fillColor: Colors.green),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Field cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          showLoaderDialog(context);
                          await pincodeController
                              .getAreaByPincode(_serachController.text)
                              .then((value) {
                            Navigator.pop(context);
                            print('d--${value.first.message}');
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  pincode: value.first,
                                ),
                              ),
                            );
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: const BorderSide(color: Colors.red))),
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
