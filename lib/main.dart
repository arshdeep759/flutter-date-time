import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //constructor
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red, brightness: Brightness.dark),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DateTimePickerScreen(),
    );
  }
}

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({super.key});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  var dateFormat = DateFormat("dd-MMM-yyyy");
  var pickDate = "Get Date";
  var timeFormat = DateFormat("hh:mm aa");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Date Time picker"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  print("clicked");
                  var date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025));
                  var formattedDate = dateFormat.format(date ?? DateTime.now());
                  pickDate = formattedDate;
                  setState(() {});
                  print("date $date formattedDate $formattedDate");
                },
                child: Text(pickDate)),
            ElevatedButton(
                onPressed: () {
                  try {
                    print("in 46");

                    showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025))
                        .then((value) {
                      print(
                          "value $value ${dateFormat.format(value ?? DateTime.now())}");
                    });
                  } catch (exception) {
                    print("exception $exception");
                  }
                },
                child: const Text("Get Date without await")),
            OutlinedButton(
                onPressed: () async {
                  var pickedTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  print("picked Time $pickedTime");
                  var pickedtime = DateTime(2024, 9, 7, pickedTime?.hour ?? 0,
                      pickedTime?.minute ?? 0);
                  var formattedTime = timeFormat.format(pickedtime);
                  print("formatted Time $formattedTime");
                },
                child: const Text("Time Picker"))
          ],
        ),
      ),
    );
  }
}
