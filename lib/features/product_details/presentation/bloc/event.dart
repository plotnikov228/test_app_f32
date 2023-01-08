abstract class ProductDetailsEvent {}

class SetupProductDetailsEvent extends ProductDetailsEvent {}
class ChangeColorDetailsEvent extends ProductDetailsEvent {
  final int index;

  ChangeColorDetailsEvent(this.index);
}
class ChangeCapacityDetailsEvent extends ProductDetailsEvent {
  final int index;

  ChangeCapacityDetailsEvent(this.index);
}