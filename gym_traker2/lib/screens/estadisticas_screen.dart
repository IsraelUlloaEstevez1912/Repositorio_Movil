import 'package:flutter/material.dart';

class EstadisticasScreen extends StatelessWidget {

  final List<double> historial;

  const EstadisticasScreen({
    super.key,
    required this.historial,
  });

  @override
  Widget build(BuildContext context) {

    double pesoActual =
        historial.isNotEmpty ? historial.last : 0;

    double pesoInicial =
        historial.isNotEmpty ? historial.first : 0;

    double cambio =
        pesoActual - pesoInicial;

    double meta =
        pesoActual + 10;

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
                  "Estadísticas",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Visualiza tu progreso físico",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                // CARDS RESUMEN
                Row(
                  children: [

                    Expanded(
                      child: _card(
                        titulo: "Peso actual",
                        valor:
                            "${pesoActual.toStringAsFixed(1)} kg",
                        icono:
                            Icons.monitor_weight,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _card(
                        titulo: "Cambio",
                        valor:
                            "${cambio.toStringAsFixed(1)} kg",
                        icono:
                            Icons.trending_up,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // META
                Container(
                  width: double.infinity,
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

                      const Text(
                        "Meta",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "${meta.toStringAsFixed(1)} kg",

                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                          color:
                              Color(0xFF2C5364),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // TITULO HISTORIAL
                const Align(
                  alignment:
                      Alignment.centerLeft,
                  child: Text(
                    "Historial",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // LISTA HISTORIAL
                Expanded(
                  child: historial.isEmpty
                      ? const Center(
                          child: Text(
                            "No hay datos aún",
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
                                        .calendar_today,
                                    color:
                                        Color(0xFF2C5364),
                                  ),

                                  const SizedBox(
                                      width: 12),

                                  Text(
                                    "Registro ${i + 1}",

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
                                    "${historial[i]} kg",

                                    style:
                                        const TextStyle(
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                      color:
                                          Color(0xFF2C5364),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),

                const SizedBox(height: 12),

                // OBJETIVO SEMANAL
                Container(
                  width: double.infinity,
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

                  child: const Text(
                    "Objetivo semanal: 4 entrenamientos",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontWeight:
                          FontWeight.w600,
                      fontSize: 15,
                      color:
                          Color(0xFF2C5364),
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

  // CARD REUTILIZABLE
  Widget _card({
    required String titulo,
    required String valor,
    required IconData icono,
  }) {

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(22),

        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 6),
          )
        ],
      ),

      child: Column(
        children: [

          Icon(
            icono,
            color: const Color(0xFF2C5364),
            size: 28,
          ),

          const SizedBox(height: 6),

          Text(
            titulo,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            valor,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Color(0xFF2C5364),
            ),
          ),
        ],
      ),
    );
  }
}