import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/button.dart';
import 'package:lab_calculations/Shared/text.dart';


class CorrectedCalciumScreen extends StatefulWidget {
  const CorrectedCalciumScreen({super.key});

  @override
  State<CorrectedCalciumScreen> createState() => _CorrectedCalciumScreenState();
}

class _CorrectedCalciumScreenState extends State<CorrectedCalciumScreen> {

  TextEditingController calciumController = TextEditingController();
  TextEditingController albuminController = TextEditingController();

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
          text: "Calcium Correction", 
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
                  SizedBox(height: height*0.2,),
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
                          num.parse(albuminController.text) < 4 ? 
                          result = (num.parse(calciumController.text)) + ((4 - (num.parse(albuminController.text) )) * 0.8)
                          : result = num.parse(calciumController.text); 
                        });
                      }
                    }
                    ),
      
                    SizedBox(height: height*0.05,),
                  
                    result != null? Column(
                      children: [
                        BuildText(
                          text: "Accurate Calcium :",
                          bold: true, 
                          color: AppColors.color2, 
                          size: 20, 
                          ),
                          SizedBox(height: height*0.02,),
                          BuildText(
                          text: "${result!.toStringAsFixed(2)} mg/dl",
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
      )
    );
  }
}