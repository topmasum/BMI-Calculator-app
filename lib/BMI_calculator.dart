import 'package:flutter/material.dart';
class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double height = 170;
  double weight = 60;
  double height2 =0;
  double get BMI{
     height2= height/100;
    return weight/(height2*height2);
  }
  String get category{
    if(BMI<18.5) return 'Underweight';
    if(BMI<25) return 'Normal';
    if(BMI<30) return 'Overweight';
    return 'Obese';
  }
  Color get color{
    if(BMI<18.5) return Colors.yellow;
    if(BMI<25) return Colors.green;
    if(BMI<30) return Colors.orange;
    return Colors.red;
  }
  String get image{
    if(BMI<18.5) return 'assets/images/underweight.png';
    if(BMI<25) return 'assets/images/normal.png';
    if(BMI<30) return 'assets/images/overweight.png';
    return 'assets/images/obese.png';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
    ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade200, Colors.blue.shade50],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
              children: [
                SizedBox(height: 40,),
                Text("Height: ${height.toInt()} cm",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'
                ),),
                Slider(
                  min: 100,
                  max: 250,
                  divisions: 120,
                  value: height,
                  onChanged: (value){
                    setState(() {
                      height=value;
                    });
                }
                ),
                Text("Weight: ${weight.toInt()} kg",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.blueAccent,
                    inactiveTrackColor: Colors.blue.shade100,
                    thumbColor: Colors.blue,
                    overlayColor: Colors.blue.withAlpha(32),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
                  ),
                  child: Slider(
                    min: 30,
                    max: 150,
                    divisions: 120,
                    value: weight,
                    onChanged: (value) {
                      setState(() {
                        weight = value;
                      });
                    },
                  ),
                ),
        
                SizedBox(height: 40,),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 8,
                  margin: EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.asset(image, width: 150),
                        SizedBox(height: 16),
                        Text("BMI: ${BMI.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        Text("Category: $category",
                            style: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
        
              ],
            ),
        ),
      ),
    );
  }
}
