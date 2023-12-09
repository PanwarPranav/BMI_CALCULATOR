import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_screen.dart';
import 'backend.dart';

class InputPage extends StatefulWidget
{

  Input createState() => Input() ;
}

class Input extends State<InputPage>
{

   static Color activecardcolor=Colors.blueAccent;
    static Color inactivecardcolor=Colors.blueGrey;
  Color malecardcolor=activecardcolor;
  Color femalecardcolor=activecardcolor;
  void updateColor(int gender)
  {
    if(gender==1)
      {
        if(malecardcolor ==activecardcolor )
          {
            malecardcolor=inactivecardcolor;
            femalecardcolor=activecardcolor;
          }
        else
          {
            malecardcolor=activecardcolor;
          }
      }
    if(gender==2)
        {
          if(femalecardcolor ==activecardcolor )
          {
            femalecardcolor=inactivecardcolor;
            malecardcolor=activecardcolor;
          }
          else
          {
            femalecardcolor=activecardcolor;
          }
        }
  }
  int height=180;
  int weight=50;
  int age=20;
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(

        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      print("Detected");
                      updateColor(1);
                    });
                  },
                  child: ReusableWidget(
                  colour: malecardcolor,
                  cardChild:IconDetail(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE'),
              ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColor(2);
                    });
                  },
                  child: ReusableWidget(
                  colour: femalecardcolor,
                  cardChild: IconDetail(
                    icon:FontAwesomeIcons.venus ,
                    label: 'FEMALE' ,) ,
              ),
                ),
              ),
            ],
          ),
          ),
          Expanded(child: ReusableWidget(
          colour: Colors.blueAccent,
          cardChild:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('HEIGHT',
                style: TextStyle(
                  color:Color(0xff0c0a00),
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
                ),
              ),

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic ,
                children: [
                  Text(
                  height.toString(),
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                  const Text('cm',
                    style: TextStyle(
                        color:Color(0xff0c0a00),
                        fontSize: 18.0,
                  ),
                  ),
                ],
              ),
              Slider(value: height.toDouble(),
                  min: 120,
                  max: 220,
                  activeColor: Colors.white,
                  inactiveColor: Colors.black87,
                  onChanged: (double newValue){
                  setState((){height=newValue.round();});
                  },
              ),
             ],
           ),
         ),
        ),

          Expanded(child:
             Row(
            children: [
              Expanded(child: ReusableWidget(colour: Colors.blueAccent,
              cardChild:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                const Text('WEIGHT',
                style:TextStyle(
                  color:Color(0xff0c0a00),
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
                ),
                ),
                Text(weight.toString(),
                style: const TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomButton(button: FontAwesomeIcons.minus,onPressed: (){
                      setState(() {
                        weight--;
                      },
                      );
                    },
                    ),
                    const SizedBox(width: 10.0,),
                    CustomButton(button: FontAwesomeIcons.plus,onPressed: (){
                      setState(() {
                        weight++;
                      },
                      );
                    },
                    )
                  ],
                )
              ],
              ),
              ),
              ),





               Expanded(child:ReusableWidget(colour: Colors.blueAccent,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Text('AGE',
                  style: TextStyle(
                    color:Color(0xff0c0a00),
                    fontWeight: FontWeight.w800,
                    fontSize: 18.0,
                  ),
                  ),
                  Text(age.toString(),
                  style:   TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomButton(button: FontAwesomeIcons.minus,onPressed: (){
                          setState(() {
                            age--;
                          });
                        },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomButton(button: FontAwesomeIcons.plus,onPressed: (){
                          setState(() {
                            age++;
                          });
                        },
                        ),
                      ],
                    )
                   ],
                   ),
                  ),

              ),

            ],

          ),
          ),
          GestureDetector(

            onTap: (){
              Brain calc=Brain(height: height,weight: weight);
              Navigator.push(context,MaterialPageRoute(builder: (context) => Result(resultBMI: calc.cal(), resultSuggestion: calc.suggestions(),)));
            },
            child: Container(

              color: Colors.blueAccent,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 50.0,
              padding: EdgeInsets.only(bottom: 15.0),
              child:
              Center(
                child:  Text('CALCULATE',
                  style:TextStyle(
                    color:Color(0xff0c0a00),
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),),
              ),
            ),
          ),
        ],
     ),

    );

  }
}
//custom widget
class IconDetail extends StatelessWidget {

  IconDetail({ required this.icon,required this.label});
 final IconData icon;
 final String label;

  @override
  Widget build(BuildContext context) {
    return  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        icon,
        size: 80.0,
      ),
      const SizedBox(height: 15.0,),
      Text(
        label,
        style: const TextStyle(
          color: Color(0xff0c0a00),
          fontWeight: FontWeight.w800,
          fontSize: 18.0,
        ),)
    ],
              );
  }
}
//custom Widget
class ReusableWidget extends StatelessWidget {

  ReusableWidget ({required this.colour, required this.cardChild});
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container
      (
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0)
      ),

    );
  }
}
//custom Styledbutton


class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.button,
    required this.onPressed,
  });

  final IconData button;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(button),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: const Color(0xFF000000),
    );
  }
}
