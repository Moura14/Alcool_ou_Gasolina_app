import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  TextEditingController gasolinaController = TextEditingController();
  TextEditingController alcoolController = TextEditingController();

  String text = "Informe o preço da gasolina e do alcool";

  void _reset() {
    gasolinaController.text = "";
    alcoolController.text = "";
    setState(() {
      text = "Informe o preço";
    });
  }

  void calculate() {
    setState(() {
      double gasolina = double.parse(gasolinaController.text);
      double alcool = double.parse(alcoolController.text);
      double best = alcool / gasolina;
      if (best < 0.7) {
        text = "É melhor abastecer com álcool";
      } else {
        text = "É melhor abastecer com gasolina";
      }
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: Icon(Icons.notification_important),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text("Entenda o cálculo"),
                  content: Text(
                      "Pegamos os 2 valores e dividimos, se o resultado for menor que 0.7 a melhor alternativa é abastecer com álcool, caso contrário abasteça com gasolina"),
                  actions: [
                    TextButton(
                      child: Text("Fechar"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        title: Text("Alcool ou Gasolina"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _reset();
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("images/image.png"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: gasolinaController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.local_gas_station_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Preço da gasolina",
                            isDense: true),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insira o preço da gasolina";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                          controller: alcoolController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Preço do álcool",
                            prefixIcon: Icon(Icons.local_gas_station_outlined),
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Insira o preço da alcool";
                            }
                            return null;
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 40,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.yellow,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        calculate();
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
