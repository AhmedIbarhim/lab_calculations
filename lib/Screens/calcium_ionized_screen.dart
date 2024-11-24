import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/button.dart';
import 'package:lab_calculations/Shared/text.dart';


class CalciumIonizedScreen extends StatefulWidget {
  const CalciumIonizedScreen({super.key});

  @override
  State<CalciumIonizedScreen> createState() => _CalciumIonizedScreenState();
}

class _CalciumIonizedScreenState extends State<CalciumIonizedScreen> {

  TextEditingController calciumController = TextEditingController();
  TextEditingController albuminController = TextEditingController();
  TextEditingController proteinController = TextEditingController();

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
          text: "Ca++", 
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
                  SizedBox(height: height*0.1,),
                  Row( 
                    children: [ 
                      BuildText(
                        text: "Total Calcium (mg/dl) :",
                        bold: true,
                        size: 15, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: calciumController,
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
                  SizedBox(height: height*0.07,),
                  BuildText(text: 'Write only one value'),
                  SizedBox(height: height*0.02,),
                  Row( 
                    children: [
                      BuildText(
                        text: "Serum Albumin (g/dl) :",
                        bold: true,
                        size: 15, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: albuminController,
                          keyboardType: const TextInputType.numberWithOptions(),
                        ),
                        ),
                    ],
                  ),
      
                  SizedBox(height: height*0.07,),
                  Row( 
                    children: [ 
                      BuildText(
                        text: "Total Protien (g/dl) :",
                        bold: true,
                        size: 15, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: proteinController,
                          keyboardType: const TextInputType.numberWithOptions(),
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
                        if (proteinController.text.isEmpty && albuminController.text.isEmpty){
                          result = null;
                        }
                        else if(proteinController.text.isNotEmpty && albuminController.text.isNotEmpty){
                          result = null;
                        }
                        else{
                          
                          setState(() {
                            proteinController.text.isEmpty ?
                          result = 0.25 * (0.9+(0.55 * (num.parse(calciumController.text))) - (0.3 * (num.parse(albuminController.text)))) :
                          result = (((6 * num.parse(calciumController.text)) + (num.parse(proteinController.text) / 3)) / (6 + num.parse(proteinController.text))) / 4;
                        });
                        
                      }
                    }
                        }
                    ),
                    SizedBox(height: height*0.05,),
                  
                    result != null? BuildText(
                      text: "Ca++ = ${result!.toStringAsFixed(3)} mmol/L",
                      bold: true, 
                      color: AppColors.color2, 
                      size: 20, 
                      ) : const SizedBox()
                ],
                     ),
            ),
          ),
        ),
      )
    );
  }
}