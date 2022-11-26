import 'package:flutter/material.dart';
import '../widgets/Side_drawer.dart';

class Filter extends StatefulWidget {
  static const routeName = '/filter';
  final Function saveFilters;
  Filter(this.saveFilters);
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  bool _GluttenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  
  Widget buildListSwitch(
    String title,
    String subtitle,
    bool currValue,
    Function updateSwitch,
  ) {
    return SwitchListTile(
      value: currValue,
      onChanged: updateSwitch,
      title: Text(
        title,
      ),
      subtitle: Text(
        subtitle,
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                final selectedFilters = {
                  'glutten': _GluttenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save),
            )
          ],
        ),
        drawer: SideDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(21),
              child: Text(
                'Adjust your meal Selection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildListSwitch("Glutten Free",
                    "Only include Glutten Free meal", _GluttenFree, (newVal) {
                  setState(() {
                    _GluttenFree = newVal;
                  });
                }),
                buildListSwitch("Lactose Free",
                    "Only include Lactose Free meal", _lactoseFree, (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
                buildListSwitch(
                    "Vegetarian", "Only include Vegetarian meal", _vegetarian,
                    (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                }),
                buildListSwitch("Vegan", "Only include Vegan meal", _vegan,
                    (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
