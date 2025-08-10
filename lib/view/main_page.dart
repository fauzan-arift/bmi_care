import 'package:flutter/material.dart';
import '../controller/bmi_service.dart';
import '../model/type_bmi.dart';
import 'info_page.dart';
import 'widgets/bottom_navbar.dart';
import 'widgets/calculate_button.dart';
import 'widgets/input_field.dart';
import 'more_info_page.dart';
import '../utils/color_help.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double height = 0;
  double weight = 0;
  TypeBMI? bmiData;
  bool isHeightEntered = false;
  bool isWeightEntered = false;
  int currentPage = 0;
  bool isKeyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFF2F0),
        centerTitle: true,
        title: const Text(
          'BMI Care',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xFF0074D9),
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              children: [
                SizedBox(height: screenHeight * 0.02),
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    child: Image.asset(
                      'images/bmi_calculator.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'BMI Calculator',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Color(0xFF0074D9),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                InputField(
                  label: 'Height (cm)',
                  hintText: 'Enter your height (cm)',
                  errorText: (isHeightEntered && height <= 99)
                      ? 'Please enter a height of at least three digits'
                      : null,
                  onChanged: (value) {
                    setState(() {
                      height = double.tryParse(value) ?? 0;
                      isHeightEntered = true;
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                InputField(
                  label: 'Weight (kg)',
                  hintText: 'Enter your weight (kg)',
                  errorText: (isWeightEntered && weight <= 9)
                      ? 'Please enter a weight of at least two digits'
                      : null,
                  onChanged: (value) {
                    setState(() {
                      weight = double.tryParse(value) ?? 0;
                      isWeightEntered = true;
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.03),
                CalculateButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      if (height > 99 && weight > 9) {
                        bmiData = BMIService().getBMIData(
                          BMIService().calculateBMI(weight, height / 100),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Invalid Input',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: const Text(
                                'Please enter valid height and weight',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              backgroundColor: Colors.white,
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF0074D9),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.03),
                if (bmiData != null)
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              '${bmiData!.bmiCategory}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: getBackgroundColor(bmiData!.index!, 1),
                              ),
                            ),
                            content: Text(
                              '${bmiData!.description}',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black87,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: getBackgroundColor(bmiData!.index!, 0),
                      margin: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                      ),
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.03,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: screenWidth * 0.02),
                            Image.asset(
                              bmiData!.imageUrl.toString(),
                              width: screenWidth * 0.3,
                              height: screenWidth * 0.25,
                              alignment: Alignment.center,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: screenHeight * 0.01,
                                    ),
                                    child: Text(
                                      'Your Result: ${bmiData!.bmiCategory.toString()}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Text(
                                    'Your BMI is ${BMIService().calculateBMI(weight, height / 100).toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Text(
                                    'Standard BMI: 20',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: getBackgroundColor(
                                        bmiData!.index!,
                                        1,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.01,
                                        horizontal: screenWidth * 0.03,
                                      ),
                                      minimumSize: Size(
                                        screenWidth * 0.1,
                                        screenHeight * 0.03,
                                      ),
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MoreInfoPage(
                                            typeBMI: bmiData!,
                                            index: bmiData!.index!,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'More Info',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.1),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavbar(
              currentPage: currentPage,
              isKeyboardVisible: isKeyboardVisible,
              onPageSelected: (int page) {
                setState(() {
                  currentPage = page;
                });
                if (page == 0) {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MainPage(),
                      transitionDuration: const Duration(milliseconds: 1200),
                    ),
                  );
                } else if (page == 1) {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const InfoPage(),
                      transitionDuration: const Duration(milliseconds: 1200),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
