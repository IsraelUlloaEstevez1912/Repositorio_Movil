import 'package:flutter/material.dart';
import 'estadisticas_screen.dart';

class PesoScreen extends StatefulWidget {
  const PesoScreen({super.key});

  @override
  State<PesoScreen> createState() =>
      _PesoScreenState();
}

class _PesoScreenState extends State<PesoScreen> {

  final pesoCtrl = TextEditingController();
  List<double> historial = [];

  @override
  void dispose() {
    pesoCtrl.dispose();
    super.dispose();
  }

  void guardarPeso() {
    FocusScope.of(context).unfocus();

    if (pesoCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ingresa un peso"),
        ),
      );
      return;
    }

    final valor =
        double.tryParse(pesoCtrl.text);

    if (valor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Valor inválido"),
        ),
      );
      return;
    }

    setState(() {
      historial.add(valor);
      pesoCtrl.clear();
    });
  }

  void irEstadisticas() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            EstadisticasScreen(
                historial: historial),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    double pesoActual =
        historial.isNotEmpty
            ? historial.last
            : 0;

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

                const SizedBox(height: 5),

                // TITULO
                const Text(
                  "Registro de Peso",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Monitorea tu progreso físico",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                // CARD PESO ACTUAL
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.all(22),

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

                      const Text(
                        "Peso Actual",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "${pesoActual.toStringAsFixed(1)} kg",

                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight:
                              FontWeight.bold,
                          color:
                              Color(0xFF2C5364),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // INPUT PESO
                Container(
                  padding:
                      const EdgeInsets.all(16),

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

                  child: TextField(
                    controller: pesoCtrl,
                    keyboardType:
                        TextInputType.number,

                    decoration: InputDecoration(
                      labelText:
                          'Nuevo peso',

                      labelStyle:
                          const TextStyle(
                        color: Colors.black87,
                      ),

                      prefixIcon:
                          const Icon(
                        Icons.monitor_weight,
                        color: Colors.black54,
                      ),

                      filled: true,
                      fillColor:
                          Colors.grey.shade100,

                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                14),
                        borderSide:
                            BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // BOTON GUARDAR
                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: guardarPeso,

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
                      'Guardar Peso',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // BOTON ESTADISTICAS
                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: OutlinedButton(
                    onPressed: irEstadisticas,

                    style:
                        OutlinedButton.styleFrom(
                      foregroundColor:
                          Colors.white,

                      side: const BorderSide(
                        color: Colors.white,
                      ),

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                16),
                      ),
                    ),

                    child: const Text(
                      'Ver Estadísticas',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // HISTORIAL
                Expanded(
                  child: historial.isEmpty
                      ? const Center(
                          child: Text(
                            "No hay registros aún",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount:
                              historial.length,

                          itemBuilder: (_, i) {

                            return Container(
                              margin:
                                  const EdgeInsets
                                      .symmetric(
                                vertical: 6,
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

                              child: Row(
                                children: [

                                  const Icon(
                                    Icons
                                        .fitness_center,
                                    color:
                                        Color(0xFF2C5364),
                                  ),

                                  const SizedBox(
                                      width: 12),

                                  Text(
                                    "${historial[i]} kg",

                                    style:
                                        const TextStyle(
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                      fontSize: 16,
                                    ),
                                  ),

                                  const Spacer(),

                                  Text(
                                    "Registro #${i + 1}",

                                    style:
                                        const TextStyle(
                                      color:
                                          Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
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