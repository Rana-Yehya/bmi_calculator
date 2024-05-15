import 'package:bmi_calculator/controller/bmi_controller.dart';
import 'package:bmi_calculator/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollectingDataScreen extends StatelessWidget {
  const CollectingDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BmiController>(
      builder: (bmiController) => Scaffold(
        backgroundColor: Color(0xFFEFF4FB),
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: GestureDetector(
                              onTap: bmiController.gendetSelectType,
                              child: Container(
                                width: 350,
                                height: 350,
                                decoration: bmiController.genderSelect == false
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: Color(0xFF2566CF),
                                        ),
                                        color:
                                            Color(0xFF2566CF).withOpacity(0.1),
                                      )
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        // border: Border.all(),
                                        color:
                                            Color(0xFF8B8B8B).withOpacity(0.1),
                                      ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    width: 120,
                                    height: 120,
                                    'assets/icons/mars-solid.svg',
                                    color: bmiController.genderSelect == false
                                        ? Color(0xFF2566CF)
                                        : Color(0xFF8B8B8B),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: GestureDetector(
                              onTap: bmiController.gendetSelectType,
                              child: Container(
                                width: 350,
                                height: 350,
                                decoration: bmiController.genderSelect == true
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: Color(0xFF2566CF),
                                        ),
                                        color:
                                            Color(0xFF2566CF).withOpacity(0.1),
                                      )
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        // border: Border.all(),
                                        color:
                                            Color(0xFF8B8B8B).withOpacity(0.1),
                                      ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/venus-solid.svg',
                                    width: 120,
                                    height: 120,
                                    color: bmiController.genderSelect == true
                                        ? Color(0xFF2566CF)
                                        : Color(0xFF8B8B8B),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height (cm)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      bmiController.height.toStringAsFixed(
                        bmiController.height.truncateToDouble() ==
                                bmiController.height
                            ? 0
                            : 1,
                      ),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SfSlider(
                      min: 90,
                      max: 240,
                      activeColor: Color(0xFF2566CF),
                      inactiveColor: Color(0xFF8B8B8B).withOpacity(0.1),
                      interval: 1500,
                      showTicks: true,
                      showLabels: true,
                      value: bmiController.height,
                      onChanged: bmiController.changeHeight,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 24, horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Color(0xFF8B8B8B).withOpacity(0.4),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    bmiController.age != 1
                                        ? bmiController.changeAge(false)
                                        : null;
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: bmiController.age == 1
                                        ? Color(0xFF8B8B8B)
                                        : Colors.black,
                                  ),
                                ),
                                Text(bmiController.age.toString()),
                                IconButton(
                                  onPressed: () {
                                    bmiController.changeAge(true);
                                  },
                                  icon: Icon(Icons.add_circle_outline),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Weight (kg)',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 24, horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Color(0xFF8B8B8B).withOpacity(0.4),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    bmiController.weight != 0
                                        ? bmiController.changeWeight(false)
                                        : null;
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: bmiController.weight == 0
                                        ? Color(0xFF8B8B8B)
                                        : Colors.black,
                                  ),
                                ),
                                Text(bmiController.weight.toString()),
                                IconButton(
                                  onPressed: () {
                                    bmiController.changeWeight(true);
                                  },
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: CustomButton(
            onTap: () {
              bmiController.calculateBmi();
              Get.toNamed('/results');
            },
            buttonChild: Text(
              'CALCULATE BMI',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
