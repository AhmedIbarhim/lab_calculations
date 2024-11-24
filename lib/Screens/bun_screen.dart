import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/button.dart';
import 'package:lab_calculations/Shared/text.dart';


class BunScreen extends StatefulWidget {
  const BunScreen({super.key});

  @override
  State<BunScreen> createState() => _BunScreenState();
}

class _BunScreenState extends State<BunScreen> {

  TextEditingController ureaController = TextEditingController();

  GlobalKey <FormState> formKey = GlobalKey();

  num? bunResult;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.color1,
        title: BuildText(
          text: "Blood Urea Nitrogen (BUN)", 
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
                  Center(
                    child: Row( 
                      children: [ 
                        BuildText(
                          text: "Serum Urea (mg/dl)",
                          bold: true,
                          size: 20, 
                          ),
                          SizedBox(width: width*0.03,),
                        SizedBox(
                          width: width*0.2,
                          height: height* 0.1,
                          child: TextFormField( 
                            controller: ureaController,
                            keyboardType: const TextInputType.numberWithOptions(),
                            validator: (value) {
                              if (num.parse(value!) < 0 ){
                                return "Urea value can't be negative";
                              }
                              else if (value.isEmpty){
                                return "This field can't be empty";
                              
                              }
                              else{return null;}
                            },
                          ),
                          )
                      ],
                    ),
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
                          bunResult = num.parse(ureaController.text) / 2.14; 
                        });
                      }
                    }
                    ),
                    SizedBox(height: height*0.07,),
                  
                    bunResult != null? BuildText(
                      text: "BUN = ${bunResult!.toStringAsFixed(2)} mg/dl",
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