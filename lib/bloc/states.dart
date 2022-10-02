abstract class AppStates{}
class InitailAppStates extends AppStates{}
class ChangeBottomAppState extends AppStates{}
class changeBottomServiceState extends AppStates{}
class SavelastpostionState extends AppStates{}
class incrementCounterAppState extends AppStates{}
class decrementCounterAppState extends AppStates{}
class ChangeColorAppState extends AppStates{}
class ChangeDrawerButtonState extends AppStates{}
class SuccessPositionState extends AppStates{}
class PermissionfailedState extends AppStates{}
class ErrorcheckEnternetState extends AppStates{}
class ConnectionDoneEnternetState extends AppStates{}
class checkEnternetState extends AppStates{}
class newPositionState extends AppStates{}
class LoadingPopservicesState extends AppStates{}
class SuccessPopservicesState extends AppStates{}
class ErrorPopservicesState extends AppStates{
  final String error;
  ErrorPopservicesState(this.error);
}
class LoadingdetailsServicesState extends AppStates{}
class SuccessdetailsServicesState extends AppStates{}
class ErrordetailsServicesState extends AppStates{
  final String error;
  ErrordetailsServicesState(this.error);
}
class LoadingAllservicesState extends AppStates{}
class SuccessAllservicesState extends AppStates{}
class ErrorAllservicesState extends AppStates{
  final String error;
  ErrorAllservicesState(this.error);
}
class LoadingShopState extends AppStates{}
class SuccessShopState extends AppStates{}
class ErrorShopState extends AppStates{
  final String error;
  ErrorShopState(this.error);
}
class LoadingEditeUserState extends AppStates{}
class SuccessEditeUserState extends AppStates{}
class   ErrorEditeUserState extends AppStates{
  final String error;
  ErrorEditeUserState(this.error);
}
class LoadingPostImageState extends AppStates{}
class SuccessPostImageState extends AppStates{}
class   ErrorPostImageState extends AppStates{
}
class SuccessUploadImageState extends AppStates{}
class savelatState extends AppStates{}
class deletelatState extends AppStates{}
class buttonCkeckState extends AppStates{}
class LoadingTypecategoriesState extends AppStates{}
class SuccessTypecategoriesState extends AppStates{}
class   ErrorTypecategoriesState extends AppStates{
  final String error;
  ErrorTypecategoriesState(this.error);
}