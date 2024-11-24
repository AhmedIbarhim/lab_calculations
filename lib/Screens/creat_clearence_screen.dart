import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/button.dart';
import 'package:lab_calculations/Shared/text.dart';


class CreatClearenceScreen extends StatefulWidget {
  const CreatClearenceScreen({super.key});

  @override
  State<CreatClearenceScreen> createState() => _CreatClearenceScreenState();
}

class _CreatClearenceScreenState extends State<CreatClearenceScreen> {

  TextEditingController creatUrineController = TextEditingController();
  TextEditingController creatSerumController = TextEditingController();
  TextEditingController volUrineController = TextEditingController();

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
          text: "Creatinine Clearence", 
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
                        text: "Serum Creat (mg/dl) :",
                        bold: true,
                        size: 15, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: creatSerumController,
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
                        text: "Urine Creat (mg/dl) :",
                        bold: true,
                        size: 15, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: creatUrineController,
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
                        text: "Urine Volume (ml) :",
                        bold: true,
                        size: 15, 
                        ),
                        const Spacer(),
                      SizedBox(
                        width: width*0.3,
                        height: height* 0.04,
                        child: TextFormField( 
                          controller: volUrineController,
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
                          result = (num.parse(creatUrineController.text) *  num.parse(volUrineController.text)) /
                          (num.parse(creatSerumController.text) * 1440);
                        });
                      }
                    }
                    ),
      
                    SizedBox(height: height*0.05,),
                  
                    result != null? Column(
                      children: [
                        BuildText(
                          text: "Creatinine Clearance =",
                          bold: true, 
                          color: AppColors.color2, 
                          size: 20, 
                          ),
                          SizedBox(height: height*0.02,),
                          BuildText(
                          text: "${result!.toStringAsFixed(2)} mL/sec",
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