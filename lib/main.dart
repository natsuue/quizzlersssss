import 'package:flutter/material.dart';
import 'Ques_Bank.dart';


void main() => runApp(Quizzler());

Question_Bank QB = Question_Bank();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                QB.getQues(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.zero)
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  QB.nextIcon(true);
                  Alerts();
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.zero)
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  QB.nextIcon(false);
                  Alerts();
                });
                //The user picked false.
              },

            ),
          ),
        ),
        Row(
          children: QB.getIcon(),
        ),
      ],
    );
  }
  void Alerts(){
    if(QB.item == 13) {
      showDialog(
        context: context,
        builder: (context) =>  CustomDialogWidget(),
    );
    }
  }
}


class CustomDialogWidget extends StatefulWidget {
const CustomDialogWidget({super.key});

  @override
  State<CustomDialogWidget> createState() => _CustomDialogWidgetState();
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QB.img(),
                const SizedBox(
                  height: 24,
                ),
                QB.Msg(),
                const SizedBox(
                  height: 4,
                ),
                QB.SubMsg(),
                const SizedBox(
                  height: 32,
                ),
                rowwing(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            height: 28,
            width: 28,
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(2),
                shape: const CircleBorder(),
                backgroundColor: Colors.red,
              ),
              child: const Icon(Icons.close_rounded),
            ),
          ),
        ],
      ),
    );
  }

Row rowwing(){
  if(QB.right >  QB.wrong){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        restart(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.black,
              padding:  const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10,
              ),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(2),),
            ),
            onPressed: (){
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) =>  const surprise()
                );
              });
            }, child: const Text('Surprise'))
      ],
    );
  }
  else{
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        restart()
      ],
    );
  }
}
ElevatedButton restart(){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
          padding:  const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(2),),
        ),onPressed: (){
        setState(() {
        QB.right = 0;
        QB.wrong = 0;
        QB.getIcon().clear();
        QB.item = 0;
        QB.Scorer.clear();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Quizzler()));
      });
    },
    child: const Text('Try Again'));
}

}

class surprise extends StatefulWidget {
  const surprise({super.key});

  @override
  State<surprise> createState() => _surpriseState();
}

class _surpriseState extends State<surprise> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Image(
                image: AssetImage('images/cry.png'),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                  padding:  const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 32,
                  ),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(2),),
                ),onPressed: (){
              setState(() {
                QB.right = 0;
                QB.wrong = 0;
                QB.getIcon().clear();
                QB.item = 0;
                QB.Scorer.clear();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Quizzler()));
              });
            },
                child: const Text('Try Again')
            )
          ],
        ),
      ),
    );
  }
}







