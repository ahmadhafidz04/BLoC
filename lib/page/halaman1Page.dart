import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la20_bloc/bloc/appbloc.dart';
import 'package:la20_bloc/bloc/appEvent.dart';
import 'package:la20_bloc/bloc/appState.dart';

class Halaman1Page extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  Halaman1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increment/Decrement App'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocBuilder to display current counter value
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                int displayValue = 0;
                if (state is InitialState) {
                  displayValue = state.initialValue;
                } else if (state is UpdateState) {
                  displayValue = state.newValue;
                }

                return Text(
                  'Counter Value: $displayValue',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 20),

            // TextField to input custom increment/decrement value
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Value',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Row with Increment and Decrement buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final input = int.tryParse(_controller.text);
                    if (input != null) {
                      context.read<AppBloc>().add(IncrementCounter(input));
                    }
                  },
                  child: const Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final input = int.tryParse(_controller.text);
                    if (input != null) {
                      context.read<AppBloc>().add(DecrementCounter(input));
                    }
                  },
                  child: const Text('Decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
