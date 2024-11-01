import 'package:flutter/material.dart';
import 'package:task3/configuration/app_theme.dart';

class CustomDropdownContainer extends StatefulWidget {
  final Function(String) onSelected;

  const CustomDropdownContainer({super.key, required this.onSelected});

  @override
  _CustomDropdownContainerState createState() =>
      _CustomDropdownContainerState();
}

class _CustomDropdownContainerState extends State<CustomDropdownContainer> {
  String selectedBranch = 'Select Branch...';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showBranchOptionsMenu(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedBranch,
                style: const TextStyle(color: Color(0xFFBFBFBF)),
              ),
              const Icon(Icons.keyboard_arrow_down, size: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _showBranchOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Select Branch',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.backgroundColor)
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.cancel_outlined),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              const Divider(),
              RadioListTile<String>(
                value: 'Rich-diets Branch one',
                groupValue: selectedBranch,
                title: const Text(
                  'Rich-diets Branch one',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dubai, Street 55 Dub Tower',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Nearest branch to you',
                      style: TextStyle(color: AppTheme.primaryColor,),
                    ),
                  ],
                ),
                activeColor: AppTheme.primaryColor,
                onChanged: (value) {
                  setState(() {
                    selectedBranch = value!;
                  });
                  widget.onSelected(value!);
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              RadioListTile<String>(
                value: 'Rich-diets Branch two',
                groupValue: selectedBranch,
                title: const Text(
                  'Rich-diets Branch two',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Dubai, Street 55 Dub Tower',
                  style: TextStyle(color: Colors.grey),
                ),
                activeColor: AppTheme.primaryColor,
                onChanged: (value) {
                  setState(() {
                    selectedBranch = value!;
                  });
                  widget.onSelected(value!);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}