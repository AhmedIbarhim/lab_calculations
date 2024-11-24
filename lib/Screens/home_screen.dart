import 'package:flutter/material.dart';
import 'package:lab_calculations/Components/components.dart';
import 'package:lab_calculations/Screens/alb_creat_screen.dart';
import 'package:lab_calculations/Screens/bmi_screen.dart';
import 'package:lab_calculations/Screens/bun_screen.dart';
import 'package:lab_calculations/Screens/calcium_ionized_screen.dart';
import 'package:lab_calculations/Screens/corrected_calcium_screen.dart';
import 'package:lab_calculations/Screens/creat_clearence_screen.dart';
import 'package:lab_calculations/Screens/gfr_screen.dart';
import 'package:lab_calculations/Screens/homa_ir_screen.dart';
import 'package:lab_calculations/Screens/inr_screen.dart';
import 'package:lab_calculations/Screens/iron_screen.dart';
import 'package:lab_calculations/Shared/card.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.color1,
        title: BuildText(text: 'Lab Calculations', color: Colors.white, bold: true,),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          Container( 
              width: width, 
              height: height,
              decoration: BoxDecoration( 
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 114, 11, 45).withOpacity(0.7),
                    Color.fromARGB(255, 31, 25, 78).withOpacity(0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  )
              ),
            ),
          SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (GridView( 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1
                ),
                physics: const BouncingScrollPhysics(),
                children: [ 
                  InkWell(
                    // ignore: prefer_const_constructors
                    onTap: (){navigateTo(context, const AlbuminCreatScreen());},
                    child: BuildCard(name: 'Alb./Creat. ratio',)),
          
                  InkWell(
                    onTap: (){navigateTo(context, const BunScreen());},
                    child: BuildCard(name: 'BUN',)),
          
                  InkWell(
                    onTap: (){navigateTo(context, const CalciumIonizedScreen());},
                    child: BuildCard(name: 'Ionized Calcium',)),
          
                  InkWell(
                    onTap: (){navigateTo(context, const CorrectedCalciumScreen());},
                    child: BuildCard(name: 'Cal. Correction',)),
          
                  InkWell(
                    onTap: (){navigateTo(context, const CreatClearenceScreen());},
                    child: BuildCard(name: 'Creat. Clearence')),
          
                  InkWell(
                    onTap: (){navigateTo(context, const GfrScreen());},
                    child: BuildCard(name: 'e-GFR',)),
          
                  InkWell(
                    onTap: (){navigateTo(context, const HomaIrScreen());},
                    child: BuildCard(name: 'HOMA-IR',)),
          
                  InkWell(
                    onTap: (){navigateTo(context, const IronScreen());},
                    child: BuildCard(name: 'Iron Profile')),
          
                    InkWell(
                    onTap: (){navigateTo(context, const InrScreen());},
                    child: BuildCard(name: 'INR')),
          
                  InkWell(
                    onTap: (){navigateTo(context, const BmiScreen());},
                    child: BuildCard(name: 'BMI')),
              
                ],
              )),
            ),
          ),
        ],
      ),

    );
  }
}