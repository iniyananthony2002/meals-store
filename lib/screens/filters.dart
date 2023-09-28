
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

enum Filter { glutenFree, lactoseFree, vegitarian, vegan }

// ignore: must_be_immutable
class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // bool _glutenFreeFilter = false;
  // var _lactoseFreeFilter = false;
  // var _vegitarianFilter = false;
  // var _veganFilter = false;

  bool glutenfree = false;
  bool lactosefree = false;
  bool vegitarian = false;
  bool vegan = false;

  void getFilter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      glutenfree = prefs.getBool('glutenFreeFilter') ?? false;
      lactosefree = prefs.getBool('lactoseFreeFilter') ?? false;
      vegitarian = prefs.getBool('vegitarianFilter') ?? false;
      vegan = prefs.getBool('veganFilter') ?? false;
    print("\n\n$glutenfree\n\n");
    });
  }

  @override
  void initState() {
    super.initState();
    getFilter();
  }

  void setglutenfreeFilter(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('glutenFreeFilter', value);
    getFilter();
  }

  void setlactosefreeFilter(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('lactoseFreeFilter', value);
    getFilter();
  }

  void setvegitarianFilter(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('vegitarianFilter', value);
    getFilter();
  }

  void setveganFilter(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('veganFilter', value);
    getFilter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //   }
      // }),
      body: Column(
          children: [
            SwitchListTile(
              value: glutenfree,
              onChanged: (isChecked) {
                setglutenfreeFilter(isChecked);
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactosefree,
              onChanged: (isChecked) {
                setlactosefreeFilter(isChecked);
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegitarian,
              onChanged: (isChecked) {
                setvegitarianFilter(isChecked);
              },
              title: Text(
                'Vegitarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegitarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegan,
              onChanged: (isChecked) {
                setveganFilter(isChecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
    );
  }
}
