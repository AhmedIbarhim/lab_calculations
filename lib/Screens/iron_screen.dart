import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/button.dart';
import 'package:lab_calculations/Shared/text.dart';


class IronScreen extends StatefulWidget {
  const IronScreen({super.key});

  @override
  State<IronScreen> createState() => _IronScreenState();
}

class _IronScreenState extends State<IronScreen> {

  TextEditingController ironController = TextEditingController();
  TextEditingController tibcController = TextEditingController();

  GlobalKey <FormState> formKey = GlobalKey();

  num? uibc;
  num? transferrin;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.color1,
        title: BuildText(
          text: "Iron Profile", 
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
                        text: "Iron (µg/dl) :",
                        bold: true,
                        size: 15, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: ironController,
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
                        text: "TIBC (µg/dl) :",
                        bold: true,
                        size: 15, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: tibcController,
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
                          transferrin = ((num.parse(ironController.text)) / (num.parse(tibcController.text))) * 100; 
                          uibc = (num.parse(tibcController.text)) - (num.parse(ironController.text)); 
                        });
                      }
                    }
                    ),
      
                    SizedBox(height: height*0.05,),
                  
                    transferrin != null? BuildText(
                      text: "Transferrin Saturation = ${transferrin!.toStringAsFixed(2)} %",
                      bold: true, 
                      color: AppColors.color2, 
                      size: 15, 
                      ) : const SizedBox(),
      
                      SizedBox(height: height*0.05,),
      
                      uibc != null? BuildText(
                      text: "UIBC = ${uibc!.toStringAsFixed(2)} µg/dl",
                      bold: true, 
                      color: AppColors.color2, 
                      size: 17, 
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