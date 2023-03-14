import 'package:equatable/equatable.dart';

class VoucherModel extends Equatable{
  final int id;
  final String code;
  final num value;

  const VoucherModel({required this.id, required this.code, required this.value});

 static List<VoucherModel> vouchers = const[
    VoucherModel(id: 1, code: 'SAVE25', value: 25),
    VoucherModel(id: 2, code: 'SAVE50', value: 50),
    VoucherModel(id: 3, code: 'SAVE75', value: 75),
   VoucherModel(id: 4, code: 'SAVE100', value: 100),
  ];

  @override
  List<Object?> get props => [id, code, value];


}