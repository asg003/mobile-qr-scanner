// import 'package:backtoschool/data_provider/barcode_data_provider.dart';
import 'package:backtoschool/data_provider/user_data_provider.dart';
import 'package:backtoschool/navigation/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  // ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<UserDataProvider>(
    create: (_) {
      var _userDataProvider = UserDataProvider();

      /// try to load any persistent saved data
      /// once loaded from memory reauthenticate user
      _userDataProvider.loadSavedData();
      return _userDataProvider;
    },
  ),
  ChangeNotifierProvider<CustomAppBar>(
    create: (_) => CustomAppBar(),
  ),
];
// List<SingleChildWidget> dependentServices = [
//   ChangeNotifierProxyProvider<UserDataProvider, BarcodeDataProvider>(
//       create: (_) {
//     var barcodeDataProvider = BarcodeDataProvider();
//     return barcodeDataProvider;
//   }, update: (_, userDataProvider, barcodeDataProvider) {
//     barcodeDataProvider.userDataProvider = userDataProvider;
//     return barcodeDataProvider;
//   }),
// ];
List<SingleChildWidget> uiConsumableProviders = [];
