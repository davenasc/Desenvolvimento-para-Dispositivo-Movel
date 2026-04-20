import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: LayoutBase()),
);

class LayoutBase extends StatefulWidget {
  const LayoutBase({super.key});

  @override
  State<LayoutBase> createState() => _LayoutBaseState();
}

class _LayoutBaseState extends State<LayoutBase> {
  int _lastSelected = 0;
  bool _isExpanded = false;

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomAppBar with FAB'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'TAB: $_lastSelected',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildExpandableFab(),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'A',
        color: Colors.grey,
        selectedColor: Colors.blue,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
          FABBottomAppBarItem(iconData: Icons.grid_view, text: 'Bottom'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
        ],
      ),
    );
  }

  Widget _buildExpandableFab() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          if (_isExpanded)
            Positioned(
              bottom: 70,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMiniFab(Icons.chat),
                  const SizedBox(height: 15),
                  _buildMiniFab(Icons.mail),
                  const SizedBox(height: 15),
                  _buildMiniFab(Icons.phone),
                ],
              ),
            ),
          FloatingActionButton(
            onPressed: () => setState(() => _isExpanded = !_isExpanded),
            backgroundColor: Colors.blue,
            elevation: 2,
            child: Icon(
              _isExpanded ? Icons.close : Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniFab(IconData icon) {
    return FloatingActionButton(
      mini: true,
      onPressed: () => setState(() => _isExpanded = false),
      backgroundColor: Colors.white,
      child: Icon(icon, color: Colors.blue),
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.iconData, required this.text});
  IconData iconData;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    super.key,
    required this.items,
    this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(items.length == 2 || items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String? centerItemText; // Adicionado '?' para permitir nulo
  final double height;
  final double iconSize;
  final Color? backgroundColor; // Adicionado '?'
  final Color? color; // Adicionado '?'
  final Color? selectedColor; // Adicionado '?'
  final NotchedShape? notchedShape; // Adicionado '?'
  final ValueChanged<int>? onTabSelected; // Adicionado '?'

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected?.call(index); // Uso do ?.call para segurança
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      notchMargin: 8.0,
      color: widget.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color? color = _selectedIndex == index
        ? widget.selectedColor
        : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(item.text, style: TextStyle(color: color, fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
