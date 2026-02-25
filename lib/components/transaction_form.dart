import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  
  final void Function (String, double) onSubmit;

  
  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  void _onSubmitted(){
    
    widget.onSubmit(titleController.text, double.tryParse(valueController.text) ?? 0);
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
                        onPressed: () => widget.onSubmit(titleController.text, double.tryParse(valueController.text) ?? 0.0), 
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