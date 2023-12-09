import 'package:flutter/material.dart';
import 'input.dart';

class Result extends StatelessWidget
{
  Result({required this.resultBMI,required this.resultSuggestion});

  String resultBMI;
  String resultSuggestion;
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text('Your result',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            ],
          ),
          ),
          Expanded(
              flex: 5,
              child:ReusableWidget(colour:Colors.blueAccent,cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children:<Widget> [
                  //Text(resultText,
                 // style: TextStyle(
                  //  color: Color(0xFF000000),
                  //  fontSize: 22.0,
                 //   fontWeight: FontWeight.bold,
                //  ),
                //  ),
                  Text(resultBMI,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 100.0,

                  ),
                  ),
                  Text(resultSuggestion,
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,

                  ) ,
                  ),
                ],
              ),) )
        ],
      ),
    );
  }
}

