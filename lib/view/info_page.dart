import 'package:flutter/material.dart';
import 'main_page.dart';
import 'widgets/bottom_navbar.dart';
import '../model/type_bmi.dart';
import '../utils/color_help.dart';
import 'more_info_page.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int currentPage = 1;

  bool isKeyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                      'images/bmi_info.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'BMI Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Color(0xFF0074D9),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'BMI (Body Mass Index) is a simple calculation used to assess whether a person has a healthy body weight for their height. It is calculated by dividing a person\'s weight in kilograms by the square of their height in meters.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const GetTypeBMIList(),
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

class GetTypeBMIList extends StatelessWidget {
  const GetTypeBMIList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: typeBMIList.length,
      itemBuilder: (context, index) {
        final type = typeBMIList[index];
        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    '${typeBMIList[index].bmiCategory}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: getBackgroundColor(index, 1),
                    ),
                  ),
                  content: Text(
                    '${type.description}',
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
            color: getBackgroundColor(index, 0),
            margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
            elevation: 3,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: screenWidth * 0.02,
                horizontal: screenWidth * 0.02,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: screenWidth * 0.02),
                  Image.asset(
                    typeBMIList[index].imageUrl.toString(),
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
                          padding: EdgeInsets.only(top: screenWidth * 0.02),
                          child: Text(
                            typeBMIList[index].bmiCategory.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        Text(
                          (typeBMIList[index].brief != null)
                              ? typeBMIList[index].brief!.join('\n')
                              : '',
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getBackgroundColor(index, 1),
                            padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.02,
                              horizontal: screenWidth * 0.03,
                            ),
                            minimumSize: Size(
                              screenWidth * 0.1,
                              screenWidth * 0.05,
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
                                  typeBMI: typeBMIList[index],
                                  index: index,
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
        );
      },
    );
  }
}
