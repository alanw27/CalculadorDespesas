import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  
  final void Function (String, double) onSubmit;
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  TransactionForm(this.onSubmit, {super.key});
    
  void _onSubmitted(){

    onSubmit(titleController.text, double.tryParse(valueController.text) ?? 0);
  }

  @override
  Widget build(BuildContext context) {    

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
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _onSubmitted, 
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