import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/button.dart';
import 'package:lab_calculations/Shared/text.dart';


class HomaIrScreen extends StatefulWidget {
  const HomaIrScreen({super.key});

  @override
  State<HomaIrScreen> createState() => _HomaIrScreenState();
}

class _HomaIrScreenState extends State<HomaIrScreen> {

  TextEditingController glucoseController = TextEditingController();
  TextEditingController insulinController = TextEditingController();

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
          text: "HOMA-IR", 
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
                        text: "Fasting Glucose :",
                        bold: true,
                        size: 17, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: glucoseController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          
                          validator: (value) {                             
                            if (value!.isEmpty){
                              return "* required value";
                            }
                            else if (int.parse(value) < 0 ){
                              return "value can't be negative";
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
                        text: "Fasting Insulin :",
                        bold: true,
                        size: 17, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: insulinController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          validator: (value) {
          
                            if (value!.isEmpty){
                              return "* required value";                             
                            }
                            else if (num.parse(value) < 0 ){
                              return "value can't be negative";
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
                          result = (num.parse(glucoseController.text) * num.parse(insulinController.text)) / 405; 
                        });
                      }
                    }
                    ),
                    SizedBox(height: height*0.05,),
                  
                    result != null? BuildText(
                      text: "HOMA-IR = ${result!.toStringAsFixed(2)}",
                      bold: true, 
                      color: AppColors.color2, 
                      size: 25, 
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