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

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: Icon(Icons.notification_important),
        onPressed: () {},
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
                    onPressed: () {},
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
