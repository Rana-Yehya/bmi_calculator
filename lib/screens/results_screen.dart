import 'package:bmi_calculator/controller/bmi_controller.dart';
import 'package:bmi_calculator/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF4FB),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Results',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFEFF4FB),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<BmiController>(
          builder: (bmiController) => Column(
            children: [
              Text(
                'Your BMI is',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // border: Border.all(
                  //   color: Color(0xFF2566CF),
                  // ),
                  color: Color(0xFF2566CF),
                ),
                child: Text(
                  '${bmiController.bmiValue!.toStringAsFixed(bmiController.bmiValue!.truncateToDouble() == bmiController.bmiValue ? 0 : 1)} \nkg/m2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Text(
                bmiString.values.elementAt(bmiController.bmiCategory!.index),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Color(0xFF8B8B8B).withOpacity(0.2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          width: 25,
                          height: 25,
                          bmiController.genderSelect == false
                              ? 'assets/icons/mars-solid.svg'
                              : 'assets/icons/venus-solid.svg',
                          color: Color(0xFF2566CF),
                        ),
                        Text(
                          bmiController.genderSelect == false
                              ? 'Male'
                              : 'Female',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          bmiController.age.toString(),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Age',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          bmiController.height.toStringAsFixed(
                              bmiController.height.truncateToDouble() ==
                                      bmiController.height
                                  ? 0
                                  : 1),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Height',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          bmiController.weight.toString(),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFF8B8B8B).withOpacity(0.2),
                    ),
                  ),
                  child: Text(
                    bmiController.explanationText!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: CustomButton(
          onTap: () {
            Get.back();
          },
          buttonChild: Text(
            'TRY AGAIN',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
