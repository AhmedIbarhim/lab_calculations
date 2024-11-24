import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/button.dart';
import 'package:lab_calculations/Shared/text.dart';

class InrScreen extends StatefulWidget {
  const InrScreen({super.key});

  @override
  State<InrScreen> createState() => _InrScreenState();
}

class _InrScreenState extends State<InrScreen> {
  TextEditingController ptController = TextEditingController();
  TextEditingController controlController = TextEditingController(text: '13');
  TextEditingController isiController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  num? result;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.color1,
          title: BuildText(
            text: "INR",
            color: Colors.white,
            bold: true,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.2,
                    ),
                    Row(
                      children: [
                        BuildText(
                          text: "PT test (sec) :",
                          bold: true,
                          size: 15,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: width * 0.3,
                          height: height * 0.04,
                          child: TextFormField(
                            controller: ptController,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "* required value";
                              } else {
                                return null;
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      children: [
                        BuildText(
                          text: "Control (sec) :",
                          bold: true,
                          size: 15,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: width * 0.3,
                          height: height * 0.04,
                          child: TextFormField(
                            controller: controlController,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "* required value";
                              } else {
                                return null;
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      children: [
                        BuildText(
                          text: "ISI :",
                          bold: true,
                          size: 15,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: width * 0.3,
                          height: height * 0.04,
                          child: TextFormField(
                            controller: isiController,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "* required value";
                              } else {
                                return null;
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    BuildButton(
                        height: height * 0.065,
                        width: width * 0.5,
                        text: "Calculate",
                        function: () {
                          FocusScopeNode focusScopeNode =
                              FocusScope.of(context);
                          if (!focusScopeNode.hasPrimaryFocus) {
                            focusScopeNode.unfocus();
                          }
                          ;
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              result = pow(
                                  (num.parse(ptController.text) /
                                      num.parse(controlController.text)),
                                  num.parse(isiController.text));
                            });
                          }
                        }),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    result != null
                        ? BuildText(
                            text: "INR = ${result!.toStringAsFixed(2)}",
                            bold: true,
                            color: AppColors.color2,
                            size: 20,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
