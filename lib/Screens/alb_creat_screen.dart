import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/button.dart';
import 'package:lab_calculations/Shared/text.dart';

class AlbuminCreatScreen extends StatefulWidget {
  const AlbuminCreatScreen({super.key});

  @override
  State<AlbuminCreatScreen> createState() => _AlbuminCreatScreenState();
}

class _AlbuminCreatScreenState extends State<AlbuminCreatScreen> {
  TextEditingController creatController = TextEditingController();
  TextEditingController albuminController = TextEditingController();

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
            text: "Alb / Creat Ratio",
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
                      height: height * 0.1,
                    ),
                    Row(
                      children: [
                        BuildText(
                          text: "Albumin in urine (mg/dl) :",
                          bold: true,
                          size: 15,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: width * 0.2,
                          height: height * 0.04,
                          child: TextFormField(
                            controller: albuminController,
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
                      height: height * 0.07,
                    ),
                    Row(
                      children: [
                        BuildText(
                          text: "Creat in urine (mg/dl) :",
                          bold: true,
                          size: 15,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: width * 0.2,
                          height: height * 0.04,
                          child: TextFormField(
                            controller: creatController,
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
                              result = ((num.parse(albuminController.text)) /
                                      ((num.parse(creatController.text)))) *
                                  1000;
                            });
                          }
                        }),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    result != null
                        ? Column(
                            children: [
                              BuildText(
                                text: "Albumin / Creatinine Ratio :",
                                bold: true,
                                color: AppColors.color2,
                                size: 18,
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              BuildText(
                                text: "${result!.toStringAsFixed(2)}",
                                bold: true,
                                color: AppColors.color2,
                                size: 20,
                              ),
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
