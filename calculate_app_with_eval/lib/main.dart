import 'package:flutter/material.dart';
import 'package:flutter_eval/flutter_eval.dart';

void main() {
  runApp(const CalculateWithEval());
}

class CalculateWithEval extends StatelessWidget {
  const CalculateWithEval({super.key});

  @override
  Widget build(BuildContext context) {
    return const EvalWidget(
      packages: {
        'calculate_app_with_eval': {
          'main.dart': '''
              import 'package:flutter/material.dart';

              class MyApp extends StatelessWidget {
                const MyApp({super.key});
                
                @override
                Widget build(BuildContext context) {
                  return MaterialApp(
                    title: 'calculate_app_with_eval',
                    home: const HomeView(),
                  );
                }
              }

              class HomeView extends StatefulWidget {
                const HomeView({Key? key}) : super(key: key);

                @override
                State<HomeView> createState() => _HomeViewState();
              }

              class _HomeViewState extends State<HomeView> {
                _HomeViewState();

                String result = "";
                String number1String = "";           
                String number2String = "";


                @override
                Widget build(BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text('Calculate App with Eval'),
                    ),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                number1String = value;
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Birinci sayıyı giriniz")
                          ),
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                number2String = value;
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "İkinci sayıyı giriniz"
                            )
                          ),
                          ElevatedButton(
                            child: Text("Topla"),
                            onPressed: (){
                              setState(() {
                                int sayi1 = int.parse(number1String);
                                int sayi2 = int.parse(number2String);
                                result = "\${sayi1 + sayi2}";
                              }); 
                            }
                          ),
                          ElevatedButton(
                            child: Text("Çıkar"),
                            onPressed: (){
                              setState(() {
                                int sayi1 = int.parse(number1String);
                                int sayi2 = int.parse(number2String);
                                result = "\${sayi1 - sayi2}";
                              }); 
                            }
                          ),
                          ElevatedButton(
                            child: Text("Çarp"),
                            onPressed: (){
                              setState(() {
                                int sayi1 = int.parse(number1String);
                                int sayi2 = int.parse(number2String);
                                result = "\${sayi1 * sayi2}";
                              }); 
                            }
                          ),
                          ElevatedButton(
                            child: Text("Böl"),
                            onPressed: (){
                              setState(() {
                                int sayi1 = int.parse(number1String);
                                int sayi2 = int.parse(number2String);
                                result = "\${sayi1 / sayi2}";
                              }); 
                            }
                          ),
                          Text(
                            'Sonuç: \$result',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      )
                    ),
                  );
                }
              }

            '''
        }
      },
      assetPath: 'assets/program.evc',
      library: 'package:calculate_app_with_eval/main.dart',
      function: 'MyApp.',
      args: [null],
    );
  }
}
