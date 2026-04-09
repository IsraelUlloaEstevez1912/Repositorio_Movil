import 'package:flutter/material.dart';
import 'seguimiento_screen.dart';

class CrearRutinaScreen extends StatefulWidget {
  final String usuario;

  const CrearRutinaScreen({super.key, required this.usuario});

  @override
  State<CrearRutinaScreen> createState() =>
      _CrearRutinaScreenState();
}

class _CrearRutinaScreenState
    extends State<CrearRutinaScreen> {

  final nombreRutinaCtrl = TextEditingController();
  List<Map<String, String>> ejercicios = [];

  @override
  void dispose() {
    nombreRutinaCtrl.dispose();
    super.dispose();
  }

  void agregarEjercicio() {
    setState(() {
      ejercicios.add({
        "nombre": "",
        "sets": "",
        "reps": ""
      });
    });
  }

  void guardarRutina() {
    FocusScope.of(context).unfocus();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            SeguimientoScreen(ejercicios: ejercicios),
      ),
    );
  }

  Widget campo({
    required String label,
    required Function(String) onChanged,
    TextInputType tipo = TextInputType.text,
  }) {
    return TextField(
      keyboardType: tipo,

      decoration: InputDecoration(
        labelText: label,
        labelStyle:
            const TextStyle(color: Colors.black87),

        filled: true,
        fillColor: Colors.grey.shade100,

        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),

        isDense: true,
      ),

      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [

                const SizedBox(height: 10),

                // TITULO
                Text(
                  'Rutina de ${widget.usuario}',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Crea tu entrenamiento personalizado",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 25),

                // TARJETA PRINCIPAL
                Container(
                  padding:
                      const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 14,
                        offset: Offset(0, 8),
                      )
                    ],
                  ),

                  child: Column(
                    children: [

                      // NOMBRE RUTINA
                      TextField(
                        controller:
                            nombreRutinaCtrl,

                        decoration: InputDecoration(
                          labelText:
                              'Nombre de la rutina',

                          prefixIcon:
                              const Icon(
                            Icons.fitness_center,
                            color: Colors.black54,
                          ),

                          filled: true,
                          fillColor:
                              Colors.grey.shade100,

                          border:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(14),
                            borderSide:
                                BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // BOTON AGREGAR
                      SizedBox(
                        width: double.infinity,

                        child:
                            ElevatedButton.icon(
                          onPressed:
                              agregarEjercicio,

                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),

                          label: const Text(
                            'Agregar Ejercicio',
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          style:
                              ElevatedButton
                                  .styleFrom(
                            backgroundColor:
                                const Color(
                                    0xFF2C5364),

                            foregroundColor:
                                Colors.white,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(16),
                            ),

                            padding:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // LISTA
                Expanded(
                  child: ejercicios.isEmpty
                      ? const Center(
                          child: Text(
                            "Agrega ejercicios a tu rutina",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount:
                              ejercicios.length,

                          itemBuilder: (_, i) {

                            return Container(
                              margin:
                                  const EdgeInsets
                                      .symmetric(
                                vertical: 8,
                              ),

                              padding:
                                  const EdgeInsets
                                      .all(14),

                              decoration:
                                  BoxDecoration(
                                color: Colors.white,

                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            18),

                                boxShadow: const [
                                  BoxShadow(
                                    color:
                                        Colors.black12,
                                    blurRadius: 10,
                                    offset:
                                        Offset(0, 6),
                                  )
                                ],
                              ),

                              child: Column(
                                children: [

                                  campo(
                                    label:
                                        "Ejercicio",
                                    onChanged:
                                        (val) =>
                                            ejercicios[i]
                                                [
                                                "nombre"] = val,
                                  ),

                                  const SizedBox(
                                      height: 10),

                                  Row(
                                    children: [

                                      Expanded(
                                        child: campo(
                                          label:
                                              "Sets",

                                          tipo:
                                              TextInputType
                                                  .number,

                                          onChanged:
                                              (val) =>
                                                  ejercicios[i]
                                                      [
                                                      "sets"] = val,
                                        ),
                                      ),

                                      const SizedBox(
                                          width: 10),

                                      Expanded(
                                        child: campo(
                                          label:
                                              "Reps",

                                          tipo:
                                              TextInputType
                                                  .number,

                                          onChanged:
                                              (val) =>
                                                  ejercicios[i]
                                                      [
                                                      "reps"] = val,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),

                const SizedBox(height: 10),

                // BOTON GUARDAR
                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: guardarRutina,

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF2C5364),

                      foregroundColor:
                          Colors.white,

                      elevation: 6,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                16),
                      ),
                    ),

                    child: const Text(
                      'Guardar Rutina',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}