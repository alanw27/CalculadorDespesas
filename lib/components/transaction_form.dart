import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  
  final void Function (String, double) onSubmit;
  const TransactionForm(this.onSubmit, {super.key});

  @override
  Widget build(BuildContext context) {

    final titleController = TextEditingController();
    final valueController = TextEditingController();
    

    return Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText:"Título" 
                    )
                  ),
                  TextField(
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText:"Valor" 
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => onSubmit(titleController.text, double.tryParse(valueController.text) ?? 0.0), 
                        child: Text(
                          "Nova Transação",
                          style: TextStyle(color: Colors.purple)
                        ),
                      ),
                    ],
                  ),  
                ],
              ),
            ),
          );
  }
}