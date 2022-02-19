import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:myopject/AddRouts.dart';
import 'package:myopject/data/CacheHelper.dart';
import 'package:sizer/sizer.dart';

import 'Presentation/moduls/splachscreen.dart';
void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
await CacheHelper.init();


  runApp(DevicePreview(
      enabled: true,
      builder: (_)=> MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder:(context, orientation, deviceType) =>  MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        useInheritedMediaQuery: true,
        onGenerateRoute: AppRoute().onGenterateRoute,
      ),
    );
  }
}
