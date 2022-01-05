import 'package:flutter/material.dart';

class TelaPrincipalPage extends StatefulWidget {
  const TelaPrincipalPage({Key? key}) : super(key: key);

  @override
  State<TelaPrincipalPage> createState() => _TelaPrincipalPageState();
}

class _TelaPrincipalPageState extends State<TelaPrincipalPage> {
  final TextEditingController _codMatController = TextEditingController();
  final TextEditingController _codLoteController = TextEditingController();
  final TextEditingController _pesoLoteController = TextEditingController();
  bool isChecked = false;
  double dropdownValue = 6.0;
  List<double> densidade = [];

  @override
  void initState() {
    super.initState();
    for (var i = 6.0; i <= 30.0; i++) {
      densidade.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'BALANÇA - EPS',
            style: TextStyle(fontSize: 40.0),
          ),
          toolbarHeight: 80,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // primeira linha - inputs e valor do peso
              Row(
                children: [
                  CustomTextFormField(
                    controller: _codMatController,
                    label: 'Cod. Material',
                  ),
                  CustomTextFormField(
                    controller: _codLoteController,
                    label: 'Cod. Lote',
                  ),
                  CustomTextFormField(
                    controller: _pesoLoteController,
                    label: 'Peso Lote',
                  ),
                  Expanded(
                    child: DropdownButtonFormField<double>(
                      decoration: InputDecoration(
                        // cor da borda
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // border radius
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Densidade',
                        labelStyle: const TextStyle(fontSize: 30.0),
                        floatingLabelStyle: const TextStyle(fontSize: 30.0),
                        fillColor: Colors.white,
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      value: dropdownValue,
                      icon: null,
                      elevation: 16,
                      style: const TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                      ),
                      alignment: Alignment.center,
                      onChanged: (double? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: densidade
                          .map<DropdownMenuItem<double>>((double value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                  ),
                  const PesoWidget(),
                ],
              ),
              // primeira segunda - botao status serial e salvar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.green, spreadRadius: 2),
                      ],
                    ),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            checkColor: Colors.white,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        const Text(
                          'Status Serial',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Salvar',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        elevation: 5,
                        minimumSize: const Size(180.0, 0),
                      ),
                    ),
                  )
                ],
              ),
              // terceira linha - grafico
              Container(
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.green, spreadRadius: 2),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PesoWidget extends StatelessWidget {
  const PesoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        height: 80,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.green, spreadRadius: 2),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              'Peso',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '0.000',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: TextFormField(
          autofocus: false,
          controller: controller,
          style: const TextStyle(fontSize: 24.0),
          decoration: InputDecoration(
            // cor da borda
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            // border radius
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: label,
            labelStyle: const TextStyle(fontSize: 30.0),
            floatingLabelStyle: const TextStyle(fontSize: 30.0),
            fillColor: Colors.white,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ),
    );
  }
}
