import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/button.dart';
import 'package:lab_calculations/Shared/text.dart';


class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey <FormState> formKey = GlobalKey();


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
          text: "BMI", 
          color: Colors.white,
          bold: true,
          ),
          centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column( 
                children: [ 
                  SizedBox(height: height*0.03),
      
                  Row( 
                    children: [ 
                      BuildText(
                        text: "Weight (kg) :",
                        bold: true,
                        size: 15, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: weightController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          
                          validator: (value) {                             
                            if (value!.isEmpty){
                              return "* required value";
                            }
                            else{return null;}
                          },
                        ),
                        )
                    ],
                  ),
                  SizedBox(height: height*0.05,),
                  Row( 
                    children: [ 
                      BuildText(
                        text: "Hwight (cm) :",
                        bold: true,
                        size: 15, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: heightController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          validator: (value) {
          
                            if (value!.isEmpty){
                              return "* required value";                             
                            }
                            else{return null;}
                          },
                        ),
                        )
                    ],
                  ),
      
                  SizedBox(height: height*0.03,),
       
                  SizedBox(height: height*0.05,),
      
                  BuildButton(
                    height: height* 0.065, 
                    width: width*0.5, 
                    text: "Calculate", 
                    function: (){
                      FocusScopeNode focusScopeNode = FocusScope.of(context);
                      if(!focusScopeNode.hasPrimaryFocus){
                        focusScopeNode.unfocus();                       
                      };
                      if (formKey.currentState!.validate()){
                        setState(() {
                          result =   (num.parse(weightController.text)) /  pow((num.parse(heightController.text) / 100), 2);                          
                       });
                      }
                    }
                    ),
      
                    SizedBox(height: height*0.05,),
                  
                    result != null? Column(
                      children: [
                        BuildText(
                          text: "BMI = ${result!.toStringAsFixed(1)}",
                          bold: true, 
                          color: AppColors.color2, 
                          size: 20, 
                          ),
                          SizedBox(height: height*0.02,),
                          BuildText(
                          text: "normal range: 18.5 - 24.9",
                          bold: true, 
                          color: AppColors.color5, 
                          size: 15, 
                          ),
                          SizedBox(height: height*0.02,),
                          BuildText(
                          text: "Over Weight: 25.0 - 29.9",
                          bold: true, 
                          color: AppColors.color5, 
                          size: 15, 
                          ),
                          SizedBox(height: height*0.02,),
                          BuildText(
                          text: "Obese: > 29.9",
                          bold: true, 
                          color: AppColors.color5, 
                          size: 15, 
                          ),
      
                      ],
                    ) : const SizedBox(),
      
                      
      
      
                ],
                     ),
            ),
          ),
        ),
      )
    );
  }
}