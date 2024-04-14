import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Warikan App",
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
// 共通スタイル
  TextStyle titleStyle = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold
  );
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(color: Color(0xFFd3d3d3))
  );


//それぞれの値
  int money = 0;
  int person = 0;

//結果的な値
  double perPerson= 0;
  int rem = 0;


  //コントローラー
  TextEditingController moneyController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController personController = TextEditingController();

// 一人当たりの金額を計算するメソッド
  String calculatePerPerson() {
    perPerson = money / person;
    return perPerson.toString();
  }

// あまりの金額を計算するメソッド
String calculateRem() {
  rem = money % person;
  return rem.toString();
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0ECFF),
      body: SafeArea(child: 
      GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 35.0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text("ワリカン",
                      style:TextStyle(
                          color: Color.fromARGB(255, 58, 53, 53),
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold),
                          )
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Money",
                          style: titleStyle.copyWith(
                          color: const Color(0xFF758492)
                          ),
                        ),
                         OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black54,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: const BorderSide(color: Colors.black54),
                            ),
                            onPressed: () {
                              setState(() {
                                // 入力した値をリセットする
                                moneyController.clear();
                                personController.clear();
                                perPerson = 0;
                                rem = 0;
                              });
                            },
                          child: const Text('RESET',
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),),
                          ),
                      ],
                    ),
                    const SizedBox(height: 15.0,),
                    TextField(
                      controller: moneyController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFf0f8ff),
                        border: outlineInputBorder,
                        enabledBorder: outlineInputBorder,
                        hintText: "金額を入力してください",
                        prefixIcon: const Icon(Icons.attach_money_rounded)
                      ),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2B4C5A)
                      )
                    ),
                    const SizedBox(
                      height: 30.0
                    ),
                    Text(
                      "Number Of People",
                      style: titleStyle.copyWith(
                        color: const Color(0xFF758492)
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    TextField(
                      controller: personController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFf0f8ff),
                        border: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        enabledBorder: outlineInputBorder,
                        hintText: "人数を入力してください",
                        prefixIcon: const Icon(Icons.person)
                      ),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2B4C5A)
                      )
                    ),
                    const SizedBox(
                      height: 38.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(30.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF67A7CC),
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "-RESULT-",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(
                            height: 10.0
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "一人当たり",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                                ),
                              const SizedBox(width: 10.0),
                              Text(
                                "${perPerson.toInt()}円",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 34.0,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               const FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:  [
                                      Text(
                                        "余り",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "$rem円",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 34.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                          ),
                          const SizedBox(
                            height: 20.0
                          ),
                          Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4682b4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                                )
                              ),
                              onPressed: () {
                              setState(() {
                                money = int.parse(moneyController.text);
                                person = int.parse(personController.text);
                                calculatePerPerson();
                                calculateRem();
                              });
                            }, child: const Text("CALCULATE",
                            style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),),
                            )
                          )
                        ],
                        )
                    )

                  ],
                )
              )
            ],
          )
        )
      ))
    );
  }
}