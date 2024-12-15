import 'package:flutter/material.dart';
import 'Ques_Bank.dart';

void main() => runApp(Quizzler());

Question_Bank QB = Question_Bank();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900, // Dark background
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
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
      mainAxisAlignment: MainAxisAlignment.center, // Center elements vertically
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Question Text
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                QB.getQues(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28.0,  // Increased font size
                  fontWeight: FontWeight.bold, // Bold font
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        // Buttons (True/False)
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // True Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 35.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: const Text(
                      'True',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        QB.nextIcon(true);
                        Alerts();
                      });
                    },
                  ),
                ),

                // False Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 35.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: const Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        QB.nextIcon(false);
                        Alerts();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        // Score icons (correct/incorrect)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: QB.getIcon(),
        ),
      ],
    );
  }

  void Alerts(){
    if(QB.item == 13) {
      showDialog(
        context: context,
        builder: (context) => const CustomDialogWidget(),
      );
    }
  }
}

// Custom Dialog Widget for result screen
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
                const SizedBox(height: 24),
                QB.Msg(),
                const SizedBox(height: 4),
                QB.SubMsg(),
                const SizedBox(height: 32),
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
              child: const Icon(Icons.close_rounded, size: 16),
            ),
          ),
        ],
      ),
    );
  }

  Row rowwing() {
    if(QB.right > QB.wrong){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          restart(),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [restart()],
      );
    }
  }

  ElevatedButton restart() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
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
      child: const Text('Try Again', style: TextStyle(fontSize: 16)),
    );
  }
}

// Surprise Dialog
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
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}