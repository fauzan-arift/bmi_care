class TypeBMI {
  final String? bmiScore;
  final String? bmiCategory;
  final String? description;
  final String? healthRisk;
  final String? recommendation;
  final String? imageUrl;
  final List<String>? brief;
  final int? index;

  TypeBMI({
    required this.bmiScore,
    required this.bmiCategory,
    required this.description,
    required this.healthRisk,
    required this.recommendation,
    required this.imageUrl,
    required this.brief,
    this.index,
  });
}

final List<TypeBMI> typeBMIList = [
  TypeBMI(
    bmiScore: 'Obese (BMI ≥ 27.5)',
    bmiCategory: 'Obese',
    description:
        'You fall into the Obese category. A BMI above 27.5 is considered high and could indicate excessive body fat.',
    healthRisk:
        'High risk of heart disease, Type 2 diabetes, High blood pressure, Sleep apnea, Joint problems',
    recommendation:
        'Engage in moderate exercise at least 30 minutes/day (walking, swimming, cycling), Consider a balanced diet with reduced sugar and saturated fats',
    imageUrl: 'images/obese.png',
    brief: ['Excess fat', 'High health risk'],
    index: 0,
  ),
  TypeBMI(
    bmiScore: 'Overweight (BMI 23.0 – 27.4)',
    bmiCategory: 'Overweight',
    description:
        'You are in the Overweight range. It means you may carry extra body weight, though not necessarily high body fat.',
    healthRisk:
        'Moderate risk of cardiovascular diseases, Higher chance of developing insulin resistance, Increased pressure on joints and spine',
    recommendation:
        'Incorporate more fruits and vegetables in daily meals, Drink more water and reduce sugary drinks, Try strength training 2–3 times a week, Monitor weight regularly',
    imageUrl: 'images/overweight.png',
    brief: ['Above healthy', 'weight range'],
    index: 1,
  ),
  TypeBMI(
    bmiScore: 'Normal (BMI 18.5 – 22.9)',
    bmiCategory: 'Normal',
    description:
        'Your BMI is in the Normal range. That’s considered a healthy body weight for your height.',
    healthRisk:
        'Low risk of heart disease and diabetes, Balanced body composition, Better energy levels and mental clarity',
    recommendation:
        'Continue healthy eating and physical activity habits, Aim for 150 minutes of exercise per week, Regular check-ups to monitor blood pressure and cholesterol',
    imageUrl: 'images/normal.png',
    brief: ['Balanced weight', 'Healthy body'],
    index: 2,
  ),
];
