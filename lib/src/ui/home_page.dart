import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/exchange_cubit.dart';
import '../bloc/exchange_state.dart';
import 'widgets/currency_input.dart';
import 'widgets/daily_rate_card.dart';
import 'widgets/exchange_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ExchangeCubit, ExchangeState>(
          builder: (context, state) {
            return ListView(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _controller.clear();

                      context.read<ExchangeCubit>().reset();
                    },
                    child: Image.asset("assets/logo.png", height: 60),
                  ),
                ),
                const SizedBox(height: 8),

                const Divider(color: Colors.grey, thickness: 1, height: 1),
                const SizedBox(height: 24),

                const Text(
                  "BRL EXCHANGE RATE",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF00B4FF)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                CurrencyInput(
                  controller: _controller,
                  onSubmit: (value) {
                    final toSymbol = value.trim().toUpperCase();

                    if (toSymbol == "BRL") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Selecione uma moeda diferente de BRL")));
                      return;
                    }

                    final valid = RegExp(r'^[A-Z]{3}$');
                    if (!valid.hasMatch(toSymbol)) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Código inválido. Use 3 letras, ex: USD, EUR, JPY.")));
                      return;
                    }

                    context.read<ExchangeCubit>().loadExchange(toSymbol);
                  },
                ),
                const SizedBox(height: 20),

                if (state is ExchangeLoading) const Center(child: CircularProgressIndicator()),

                if (state is ExchangeLoaded) ...[
                  ExchangeCard(rate: state.rate, from: "BRL", to: _controller.text.toUpperCase(), lastUpdatedAt: state.lastUpdatedAt),
                  const SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        trailing: const Icon(Icons.add, color: Colors.blue),
                        title: const Text("LAST 30 DAYS", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        children: [
                          Container(
                            color: Colors.grey[100],
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.history.length,
                                  itemBuilder: (context, index) {
                                    final day = state.history[index];
                                    return DailyRateCard(dailyRate: day);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.blue, thickness: 2),
                    ],
                  ),
                ],

                if (state is ExchangeError) Center(child: Text("Erro: ${state.message}")),

                if (state is ExchangeInitial) const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF00B4FF),
        padding: const EdgeInsets.all(12),
        child: const Text(
          "Powered by Action Labs © 2025",
          style: TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
