import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  
  final void Function (String, double, DateTime) onSubmit;
  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime? _selectedDate;

  void _onSubmitted(){
    widget.onSubmit(titleController.text, double.tryParse(valueController.text) ?? 0, _selectedDate!);
  }

  void _showDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now()
    ).then((dt) {
       if(dt == null) return;

      setState(() {
        _selectedDate = dt;
      });
    });

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
                    onSubmitted: (_) => widget.onSubmit(titleController.text, double.tryParse(valueController.text) ?? 0, _selectedDate!), 
                    decoration: InputDecoration(
                      labelText:"Valor" 
                    )
                  ),
                  SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _selectedDate == null ? "Nenhuma data selecionada" 
                            : "Data selecionada ${DateFormat("dd/MM/yyyy").format(_selectedDate!)}"
                          )
                        ),
                        TextButton(
                          onPressed: _showDatePicker, 
                          child: Text(
                            "Selecionar data",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: _onSubmitted, 
                        child: Text(
                          "Nova Transação"
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