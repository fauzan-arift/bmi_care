import '../model/type_bmi.dart';

class BMIService {
  double calculateBMI(double weight, double height) {
    return weight / (height * height);
  }

  TypeBMI getBMIData(double bmiValue) {
    if (bmiValue >= 27.5) {
      return typeBMIList[0]; // Obese
    } else if (bmiValue >= 23.0 && bmiValue <= 27.4) {
      return typeBMIList[1]; // Overweight
    } else if (bmiValue >= 18.5 && bmiValue <= 22.9) {
      return typeBMIList[2]; // Normal
    } else {
      throw Exception('BMI value is out of defined range');
    }
  }
}