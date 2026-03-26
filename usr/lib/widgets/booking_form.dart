// lib/widgets/booking_form.dart - Reusable booking form
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  const BookingForm({super.key, required this.onSubmit});

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _fatherController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _bookingType = 'Home';
  String _paymentMode = 'Cash';
  double _total = 0;
  double _advance = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(controller: _nameController, decoration: const InputDecoration(labelText: 'Customer Name'), validator: (v) => v!.isEmpty ? 'Required' : null),
          TextFormField(controller: _fatherController, decoration: const InputDecoration(labelText: 'Father Name')),
          TextFormField(controller: _phoneController, decoration: const InputDecoration(labelText: 'Phone'), validator: (v) => v!.isEmpty ? 'Required' : null),
          TextFormField(controller: _addressController, decoration: const InputDecoration(labelText: 'Address'), validator: (v) => v!.isEmpty ? 'Required' : null),
          ListTile(
            title: Text('Date: ${DateFormat.yMd().format(_selectedDate)}'),
            trailing: IconButton(icon: const Icon(Icons.calendar_today), onPressed: () async {
              final date = await showDatePicker(context: context, initialDate: _selectedDate, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));
              if (date != null) setState(() => _selectedDate = date);
            }),
          ),
          DropdownButtonFormField<String>(
            value: _bookingType,
            items: ['Home', 'Parlour'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (v) => setState(() => _bookingType = v!),
            decoration: const InputDecoration(labelText: 'Booking Type'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Total Amount'),
            keyboardType: TextInputType.number,
            onChanged: (v) => _total = double.tryParse(v) ?? 0,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Advance Paid'),
            keyboardType: TextInputType.number,
            onChanged: (v) => _advance = double.tryParse(v) ?? 0,
          ),
          DropdownButtonFormField<String>(
            value: _paymentMode,
            items: ['Online', 'Cash'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (v) => setState(() => _paymentMode = v!),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSubmit({
                  'customerName': _nameController.text,
                  'fatherName': _fatherController.text,
                  'phone': _phoneController.text,
                  'address': _addressController.text,
                  'date': _selectedDate,
                  'bookingType': _bookingType,
                  'totalAmount': _total,
                  'advancePaid': _advance,
                  'remainingAmount': _total - _advance,
                  'paymentMode': _paymentMode,
                  'services': [], // Add selected services
                  'status': 'Pending',
                });
              }
            },
            child: const Text('Submit Booking'),
          ),
        ],
      ),
    );
  }
}