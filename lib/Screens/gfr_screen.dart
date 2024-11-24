import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/button.dart';
import 'package:lab_calculations/Shared/text.dart';


class GfrScreen extends StatefulWidget {
  const GfrScreen({super.key});

  @override
  State<GfrScreen> createState() => _GfrScreenState();
}

class _GfrScreenState extends State<GfrScreen> {

  TextEditingController creatController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  GlobalKey <FormState> formKey = GlobalKey();

  String? gender = 'male';

  String? skinColor = 'light';

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
          text: "e-GFR", 
          color: Colors.white,
          bold: true,
          ),
          centerTitle: true,
      ),
      body:GestureDetector(
        onTap:(){
          FocusScopeNode focusScopeNode = FocusScope.of(context);
          if(!focusScopeNode.hasPrimaryFocus){
            focusScopeNode.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column( 
                  children: [ 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width* 0.5,
                          height: height* 0.05,
                          child: RadioListTile(
                            value: 'male', 
                            title: BuildText(text: 'Male', bold: true, size: 15,),
                            groupValue: gender,
                            activeColor: AppColors.color6,
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: height* 0.03,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.5,
                          height: height* 0.05,
                          child: RadioListTile(
                                  value: 'female', 
                                  title: BuildText(text: 'Female', bold: true, size: 15,),
                                  groupValue: gender,
                                  activeColor: AppColors.color7,
                                  onChanged: (value) {
                                    setState(() {
                                    gender = value;
                                    });
                                              },
                                            ),
                        ),
                      ],
                    ),
        
                    SizedBox(height: height*0.03),
        
        
                    Row( 
                      children: [ 
                        BuildText(
                          text: "Serum Creat (mg/dl) :",
                          bold: true,
                          size: 15, 
                          ),
                          const Spacer(),
                        SizedBox(
                          width: width*0.3,
                          height: height* 0.04,
                          child: TextFormField( 
                            controller: creatController,
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
                          text: "Age (years) :",
                          bold: true,
                          size: 15, 
                          ),
                          const Spacer(),
                        SizedBox(
                          width: width*0.3,
                          height: height* 0.04,
                          child: TextFormField( 
                            controller: ageController,
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
                    BuildText(text: "Choose skin color"),
        
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width* 0.5,
                          height: height* 0.05,
                          child: RadioListTile(
                            value: 'light', 
                            title: BuildText(text: 'Light', bold: true, size: 15,),
                            groupValue: skinColor,
                            activeColor: Colors.brown[200],
                            onChanged: (value) {
                              setState(() {
                                skinColor = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: height* 0.03,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.5,
                          height: height* 0.05,
                          child: RadioListTile(
                                  value: 'dark', 
                                  title: BuildText(text: 'Dark', bold: true, size: 15,),
                                  groupValue: skinColor,
                                  activeColor: Colors.brown,
                                  onChanged: (value) {
                                    setState(() {
                                    skinColor = value;
                                    });
                                              },
                                            ),
                        ),
                      ],
                    ),
        
                   
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
                            result = 186 * (pow(num.parse(creatController.text), -1.154) *  pow(num.parse(ageController.text), -0.203));
                            if(gender == 'female'){result = result! * 0.742;}
                            if(skinColor == 'dark'){result = result! * 1.210;}
                         });
                        }
                      }
                      ),
        
                      SizedBox(height: height*0.05,),
                    
                      result != null? Column(
                        children: [
                          BuildText(
                            text: "e-GFR =",
                            bold: true, 
                            color: AppColors.color2, 
                            size: 20, 
                            ),
                            SizedBox(height: height*0.02,),
                            BuildText(
                            text: "${result!.toStringAsFixed(2)} mL/min",
                            bold: true, 
                            color: AppColors.color2, 
                            size: 20, 
                            ),
        
                        ],
                      ) : const SizedBox(),
        
                        
        
        
                  ],
                       ),
              ),
            ),
          ),
        ),
      )
    );
  }
}