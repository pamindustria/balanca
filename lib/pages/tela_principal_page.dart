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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'BALANÇA - EPS',
                style: TextStyle(fontSize: 40.0),
              ),
              Text(
                '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                style: const TextStyle(fontSize: 40.0),
              ),
            ],
          ),
          toolbarHeight: 70,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 8.0),
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
                        fontSize: 39.0,
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
                  const CustomPesoField(),
                ],
              ),
              // primeira segunda - botao status serial e salvar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, spreadRadius: 1),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              const Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Status Serial',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, spreadRadius: 1),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              const Padding(
                                padding: EdgeInsets.only(left: 13.0),
                                child: Text(
                                  'Status SQL',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Salvar',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        elevation: 5,
                        minimumSize: const Size(255.0, 0),
                      ),
                    ),
                  )
                ],
              ),
              // terceira linha - grafico
              Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, spreadRadius: 1),
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
          style: const TextStyle(fontSize: 30.0),
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

class CustomPesoField extends StatelessWidget {
  const CustomPesoField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: TextFormField(
          autofocus: false,
          initialValue: '0.000',
          readOnly: true,
          style: const TextStyle(
            fontSize: 60.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 18.0, top: 0.0, bottom: 0.0),
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
            labelText: 'Peso',
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
