import 'package:flutter/material.dart';
import '../../../configuration/app_theme.dart';
import '../../../configuration/custom_text_widget.dart';

class DeliveryPickup extends StatefulWidget {
  const DeliveryPickup({super.key});

  @override
  State<DeliveryPickup> createState() => _DeliveryPickupState();
}

class _DeliveryPickupState extends State<DeliveryPickup> {
  String selectedMethod = 'Pickup';

  void _selectMethod(String method) {
    setState(() {
      selectedMethod = method;
    });
  }

  Widget _buildOptionCard(String method, String iconPath) {
    final isSelected = selectedMethod == method;
    return Expanded(
      child: InkWell(
        onTap: () => _selectMethod(method),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffEDEDED) : const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? const Color(0xffEDEDED) : const Color(0xFF8C8C8C),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 50,
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.primaryColor : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(iconPath, height: 25, width: 25),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextWidget(
                  text: method,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildOptionCard('Delivery', 'assets/icons/delivery.png'),
        const SizedBox(width: 16),
        _buildOptionCard('Pickup', 'assets/icons/order.png'),
      ],
    );
  }
}
