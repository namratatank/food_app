import 'package:equatable/equatable.dart';

class DeliveryTimeModel extends Equatable {
  final int id;
  final String value;
  final DateTime time;

  const DeliveryTimeModel(
      {required this.id, required this.value, required this.time});

  @override
  List<Object?> get props => [id, value, time];

  static List<DeliveryTimeModel> deliveryTimes = [
    DeliveryTimeModel(
      id: 1,
      value: '8:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        0,
      ),
    ),
    DeliveryTimeModel(
      id: 2,
      value: '8:30pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        30,
      ),
    ),
    DeliveryTimeModel(
      id: 3,
      value: '9:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        21,
        0,
      ),
    ),
    DeliveryTimeModel(
      id: 4,
      value: '9:30pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        21,
        30,
      ),
    ),
    DeliveryTimeModel(
      id: 5,
      value: '10:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        22,
        0,
      ),
    ),
    DeliveryTimeModel(
      id: 6,
      value: '22:30pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        22,
        30,
      ),
    ),
  ];
}
