import 'package:get/get.dart';

enum BmiCategory { underweight, normal, overweight, obese }

Map<BmiCategory, String> bmiString = {
  BmiCategory.underweight: "Underweight",
  BmiCategory.normal: "Normal weight",
  BmiCategory.overweight: "Overweight",
  BmiCategory.obese: "Obese"
};

class BmiController extends GetxController {
  bool genderSelect = false;
  double height = 150;
  int age = 2;
  double weight = 90;
  double? bmiValue;
  BmiCategory? bmiCategory;
  String? explanationText;
  void gendetSelectType() {
    genderSelect = !genderSelect;
    update();
  }

  void changeHeight(dynamic newValue) {
    height = newValue;
    update();
  }

  void changeAge(bool isIncreasing) {
    age = isIncreasing == true ? age + 1 : age - 1;
    update();
  }

  void changeWeight(bool isIncreasing) {
    weight = isIncreasing == true ? weight + 1 : weight - 1;
    update();
  }

  void calculateBmi() {
    double heightPerM = height / 100;
    bmiValue = weight / (heightPerM * heightPerM);
    if (bmiValue! < 18.5) {
      bmiCategory = BmiCategory.underweight;
      explanationText =
          "Addressing underweight status typically involves improving nutritional intake through a balanced diet that provides adequate calories, protein, vitamins, and minerals. In some cases, medical intervention and monitoring may be necessary to address underlying health conditions contributing to being underweight. Consulting with a healthcare professional, such as a doctor or registered dietitian, is essential for personalized guidance and support.";
    } else if (bmiValue! >= 18.5 && bmiValue! < 25) {
      bmiCategory = BmiCategory.normal;
      explanationText =
          "While being within the normal weight range is generally associated with better health outcomes, it's important to remember that BMI is just one indicator of health and doesn't account for factors such as muscle mass, bone density, and distribution of body fat. Additionally, individual health can vary based on factors like genetics, lifestyle habits, and overall fitness level. Therefore, it's essential to focus on overall health and well-being rather than solely on achieving a specific BMI range. Regular physical activity, balanced nutrition, and routine health screenings are important components of maintaining good health regardless of BMI.";
    } else if (bmiValue! >= 25 && bmiValue! < 30) {
      bmiCategory = BmiCategory.overweight;
      explanationText =
          "Addressing overweight status typically involves lifestyle modifications aimed at achieving a healthier weight, such as adopting a balanced diet, increasing physical activity, managing stress, and getting adequate sleep. Consulting with healthcare professionals, such as doctors, dietitians, or personal trainers, can provide personalized guidance and support in developing sustainable habits for weight management and overall health improvement.";
    } else {
      bmiCategory = BmiCategory.obese;
      explanationText =
          "Addressing obesity typically requires comprehensive lifestyle changes, including dietary modifications, increased physical activity, behavior modification strategies, and sometimes medical interventions such as weight-loss medications or bariatric surgery. It's crucial for individuals with obesity to seek professional guidance from healthcare providers, including physicians, dietitians, and mental health professionals, to develop personalized treatment plans that prioritize long-term health and well-being.";
    }
    update();
  }
}
