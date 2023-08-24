import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_reader/app/controller/home.dart';
import 'package:telephony/telephony.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController.to.telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          // Handle message
        },
        listenInBackground: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      HomeController.to.readSms();
                    },
                    child: Container(
                      // width: 50,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.teal.shade400,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text("Check"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Credited Data Length: ',
                      style: const TextStyle(
                          fontFamily: 'regular', color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' ${HomeController.to.creditedData.length}',
                          style: const TextStyle(
                            fontFamily: 'medium',
                            color: Colors.green,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Get.to(() => Register());
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Debited Data Length: ',
                      style: const TextStyle(
                          fontFamily: 'regular', color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' ${HomeController.to.debitedData.length}',
                          style: const TextStyle(
                            fontFamily: 'medium',
                            color: Colors.green,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Get.to(() => Register());
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Text(
                  "Credited Data",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Obx(() => HomeController.to.creditedData.isEmpty
                  ? Text("No Credited Data")
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: HomeController.to.creditedData.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return HomeController.to.creditedData[index].body
                                .contains('credited')
                            ? Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(.3),
                                          spreadRadius: 1,
                                          blurRadius: 1)
                                    ]),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Message: ',
                                    style: const TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            ' ${HomeController.to.creditedData[index].body}',
                                        style: const TextStyle(
                                          fontFamily: 'medium',
                                          color: Colors.green,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Get.to(() => Register());
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox();
                      })),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Text(
                  "Debited Data",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Obx(() => HomeController.to.debitedData.isEmpty
                  ? Text("No Debited Data")
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: HomeController.to.debitedData.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return HomeController.to.debitedData[index].body
                                .contains('debited')
                            ? Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(.3),
                                          spreadRadius: 1,
                                          blurRadius: 1)
                                    ]),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Message: ',
                                    style: const TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            ' ${HomeController.to.debitedData[index].body}',
                                        style: const TextStyle(
                                          fontFamily: 'medium',
                                          color: Colors.red,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Get.to(() => Register());
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox();
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
