import 'package:crafty_bay/app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<ThemeMode>(
      initialSelection: context
          .read<ThemeProvider>()
          .currentThemeMode,
      label: const Text('Theme'),
      onSelected: (ThemeMode?theme) {
        context.read<ThemeProvider>().changeTheme(theme!);
      },
      dropdownMenuEntries: [
        DropdownMenuEntry(value: .light, label: 'Light'),
        DropdownMenuEntry(value: .dark, label: 'Dark'),
        DropdownMenuEntry(value: .system, label: 'System'),
      ],
    );
  }
}
