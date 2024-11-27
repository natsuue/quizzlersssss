import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Question_Bank{

  int item = 0;
  int right = 0;
  int wrong = 0;
  List <Question> Qobg = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
    Question(
        '', true),
  ];
  List <Icon> Scorer = [];


  String getQues(){
    return Qobg[item].tanong;
  }

  bool getAns(){
    return Qobg[item].sagot;
  }

  void nextItem(){
    if(item < 13){
      item++;
    }
  }

  List <Icon> getIcon(){
    return Scorer;
  }

  void nextIcon(bool A) {
    if (item < 13) {
      if (getAns() == A) {
        Scorer.add(const Icon(Icons.check,
          color: Colors.green,)
        );
        right++;
      }
      else {
        Scorer.add(const Icon(Icons.close,
          color: Colors.red,),
        );
       wrong++;
      }
      nextItem();
    }
  }

  Image img(){
    if(right > wrong ){
      return Image.asset('images/emojo.png');
    }
    else{
      return Image.asset('images/cry.png');
    }
  }

  Text Msg(){
    if(right>wrong){
      return Text('Congratulations!',
        style: GoogleFonts.montserrat(
          fontSize: 24,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        )
      );
    }
    else{
      return Text('Please Try Again',
          style: GoogleFonts.montserrat(
          fontSize: 24,
          color: Colors.green,
          fontWeight: FontWeight.bold,)
      );
    }
  }

  Text SubMsg(){
    if(right>wrong){
      return Text(
        'You are going to be the next einstein',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
        ),

      );
    }
    else{
      return Text(
        'Your IQ is lower than 25',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
        ),
      );
    }

  }


}




