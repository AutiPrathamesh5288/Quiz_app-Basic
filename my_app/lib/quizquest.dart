import 'package:flutter/material.dart';

class QuizQuest extends StatefulWidget {
  const QuizQuest({super.key});

  @override
  State<QuizQuest> createState() => _QuizQuestState();
}

class AppInfo {
  final int? answerIndex;
  final String? question;
  final List<String>? options;
  const AppInfo({ this.question,this.options,this.answerIndex});
}

class _QuizQuestState extends State<QuizQuest> {
  List allQuestions = [
    const AppInfo(
      question: "Which programming language is used in Flutter ?",
      options: ["Java", "Swift", "Kotlin", "Dart"],
      answerIndex: 3,
    ),
    const AppInfo(
      question: "What does 'Stateful' mean in Flutter ?",
      options: [
        " Changeable",
        " Constant ",
        "No internal state",
        "External state"
      ],
      answerIndex: 0,
    ),
    const AppInfo(
      question: "What is the purpose of pubspec.yaml in Flutter ?",
      options: [
        "Define dependencies",
        "Main code ",
        "Configure permissions ",
        "UI layouts"
      ],
      answerIndex: 0,
    ),
    const AppInfo(
      question: "What is the default desktop environment of Ubuntu ?",
      options: [" KDE Plasma", "GNOME", " Xfce", "Unity"],
      answerIndex: 1,
    ),
    const AppInfo(
      question: "Which of the following is a RDBMS?",
      options: ["MongoDB", "Cassandra", "MySQL", "Redis "],
      answerIndex: 2,
    ),
  ];

  int questionScreen = 0;
  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int noOfCorrectAnswers = 0;

  MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex].answerIndex) {
        if (buttonIndex == selectedAnswerIndex) {
          noOfCorrectAnswers++;
        }
        return const MaterialStatePropertyAll(Color.fromARGB(255, 79, 255, 85));
      } else if (buttonIndex != allQuestions[questionIndex].answerIndex &&
          buttonIndex == selectedAnswerIndex) {
        return const MaterialStatePropertyAll(Color.fromARGB(243, 251, 86, 74));
      } else {
        return const MaterialStatePropertyAll(Colors.tealAccent);
      }
    } else {
      return const MaterialStatePropertyAll(Colors.tealAccent);
    }
  }

  void validateCurrentPage() {
    if (selectedAnswerIndex == -1) {
      return;
    }

    if (selectedAnswerIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        setState(() {
          questionScreen = 2;
        });
      }
      selectedAnswerIndex = -1;
      setState(() {
        questionIndex += 1;
      });
    }
  }

  Scaffold whichScreen() {
    // Front Page
    if (questionScreen == 0) {
      return Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(196, 0, 255, 221),
                Color.fromARGB(23, 236, 136, 23),
              ],
            )),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/que.gif",
                      height: 180,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/image1.png",
                  height: 450,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.amber),
                        foregroundColor: MaterialStatePropertyAll(Colors.black),
                        side: MaterialStatePropertyAll(
                            BorderSide(color: Colors.black)),
                        padding: MaterialStatePropertyAll(EdgeInsets.only(
                            top: 5, bottom: 5, left: 40, right: 40)),
                      ),
                      onPressed: () {
                        setState(() {
                          questionScreen = 1;
                        });
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/brain.png",
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "Let's Begin",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            "assets/brain.png",
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else if (questionScreen == 1) {
      // Question Screen
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizQuest",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
                color: Color(0xFFf5793B)),
          ),
          leading: const Icon(
            Icons.assignment_outlined,
            size: 35,
          ),
          centerTitle: true,
          backgroundColor: Colors.tealAccent,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.home_outlined,
                size: 35,
              ),
              onPressed: () {
                setState(() {
                  questionScreen = 0;
                  
                });
              },
            )
          ],
        ),
        body: Container(
          color: const Color.fromARGB(112, 129, 255, 228),
          child: Column(children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Questions : ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Text("${questionIndex + 1}/${allQuestions.length}",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              width: 350,
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(102, 100, 255, 219),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                allQuestions[questionIndex].question,
                style: const TextStyle(
                    color: Color.fromARGB(201, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 0;
                  });
                }
              },
              style: ButtonStyle(
                backgroundColor: checkAnswer(0),
                side: const MaterialStatePropertyAll(
                    BorderSide(color: Colors.black, width: 0.5)),
                fixedSize: const MaterialStatePropertyAll(Size.fromWidth(350)),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 8, bottom: 8)),
              ),
              child: Text(
                "A.   ${allQuestions[questionIndex].options[0]}",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 1;
                  });
                }
              },
              style: ButtonStyle(
                side: const MaterialStatePropertyAll(
                    BorderSide(color: Colors.black, width: 0.5)),
                backgroundColor: checkAnswer(1),
                fixedSize: const MaterialStatePropertyAll(Size.fromWidth(350)),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 8, bottom: 8)),
              ),
              child: Text(
                "B.   ${allQuestions[questionIndex].options[1]}",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 2;
                  });
                }
              },
              style: ButtonStyle(
                side: const MaterialStatePropertyAll(
                    BorderSide(color: Colors.black, width: 0.5)),
                fixedSize: const MaterialStatePropertyAll(Size.fromWidth(350)),
                backgroundColor: checkAnswer(2),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 8, bottom: 8)),
              ),
              child: Text(
                "C.   ${allQuestions[questionIndex].options[2]}",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 3;
                  });
                }
              },
              style: ButtonStyle(
                side: const MaterialStatePropertyAll(
                    BorderSide(color: Colors.black, width: 0.5)),
                backgroundColor: checkAnswer(3),
                fixedSize: const MaterialStatePropertyAll(Size.fromWidth(350)),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.only(top: 8, bottom: 8)),
              ),
              child: Text(
                "D.   ${allQuestions[questionIndex].options[3]}",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 200,
                  ),
                  Image.asset(
                    // "assets/plain_bulb.png",
                    "assets/light_bulb.png",
                    height: 95,
                  ),
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            validateCurrentPage();
          },
          backgroundColor: Colors.tealAccent,
          child: const Icon(
            Icons.forward,
            size: 30,
            color: Color(0xFFf5793B),
          ),
        ),
      );
    } else if (questionScreen == 2) {
      if(noOfCorrectAnswers < 2){
        return Scaffold(
          body: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(196, 255, 146, 138),
                Color.fromARGB(19, 250, 203, 121),
              ],
            )),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/fail.png",
                  height: 500,
                  width: 500,
                ),
                
                const Text(
                  "Sorry...You are failed !",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 85, 0),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Please try again ",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 85, 0)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 90,
                  width: 230,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 94, 48, 48), width: 5),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.tealAccent[600],
                  ),
                  child: Text(
                    "You Scored : $noOfCorrectAnswers/${allQuestions.length}",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.home,
                            size: 25,
                          ),
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.amber),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            side: MaterialStatePropertyAll(
                                BorderSide(color: Colors.black)),
                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                top: 5, bottom: 5, left: 20, right: 20)),
                          ),
                          onPressed: () {
                            setState(() {
                              questionIndex = 0;
                              questionScreen = 0;
                              noOfCorrectAnswers = 0;
                              selectedAnswerIndex = -1;

                              setState(() {});
                            });
                          },
                          label: const Row(
                            children: [
                              Text(
                                "Home",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.restart_alt,
                            size: 25,
                          ),
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.amber),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            side: MaterialStatePropertyAll(
                                BorderSide(color: Colors.black)),
                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                top: 5, bottom: 5, left: 20, right: 20)),
                          ),
                          onPressed: () {
                            setState(() {
                              questionIndex = 0;
                              questionScreen = 1;
                              noOfCorrectAnswers = 0;
                              selectedAnswerIndex = -1;

                              setState(() {});
                            });
                          },
                          label: const Row(
                            children: [
                              Text(
                                "Restart",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
        
      }
    else{
      return Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(196, 0, 255, 221),
                Color.fromARGB(19, 250, 203, 121),
              ],
            )),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset(
                  "assets/congratulations.png",
                  height: 180,
                  width: 450,
                ),
                Image.asset(
                  "assets/trophy.gif",
                  height: 250,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Congratulations...!",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 85, 0),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "You have completed the Quiz",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 85, 0)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 90,
                  width: 230,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 5),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.tealAccent[600],
                  ),
                  child: Text(
                    "You Scored : $noOfCorrectAnswers/${allQuestions.length}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.home,
                            size: 25,
                          ),
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.amber),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            side: MaterialStatePropertyAll(
                                BorderSide(color: Colors.black)),
                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                top: 5, bottom: 5, left: 20, right: 20)),
                          ),
                          onPressed: () {
                            setState(() {
                              questionIndex = 0;
                              questionScreen = 0;
                              noOfCorrectAnswers = 0;
                              selectedAnswerIndex = -1;

                              setState(() {});
                            });
                          },
                          label: const Row(
                            children: [
                              Text(
                                "Home",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    } else {
      return const Scaffold();
    }
  }

  @override
  Widget build(BuildContext context) {
    return whichScreen();
  }
}
