import 'package:dispose_test/app/app.bottomsheets.dart';
import 'package:dispose_test/app/app.dialogs.dart';
import 'package:dispose_test/app/app.locator.dart';
import 'package:dispose_test/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel() {
    print("new viewModel created");
  }
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  @override
  void dispose() {
    print("disposed");
    super.dispose();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  void navback() {
    locator<NavigationService>().back();
  }
}
