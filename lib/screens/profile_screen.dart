import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task3/configuration/app_theme.dart';
import '../configuration/custom_text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  height: 250,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomTextWidget(
                            text: 'Profile',
                            fontWeight: FontWeight.w500,
                          ),
                          IconButton(
                            icon: const Icon(Icons.settings_outlined, color: AppTheme.textTitleColor),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/images/profile.jpg'),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: 'Mohammed Ali',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              CustomTextWidget(
                                text: 'Mohammed@example.com',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                _buildWalletCard(),
              ],
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildProfileOptions(),
                  const Divider(height: 16),
                  _buildLogoutButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildWalletCard() {
    return Positioned(
      top: 180,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildWalletInfo(),
            _buildManagerIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(
          text: 'Last Charged: 01-01-2023',
          fontWeight: FontWeight.w500,
          color: Colors.white70,
          fontSize: 12,
        ),
        const SizedBox(height: 8),
        const CustomTextWidget(
          text: 'Your Wallet',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 4),
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 15,
              width: 5,
            ),
            const CustomTextWidget(
              text: '280,00 AED',
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildManagerIcon() {
    return Column(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: IconButton(
            icon: const ImageIcon(
              AssetImage("assets/icons/convert-card.png"),
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Manager',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOptions() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: profileItems.length,
      itemBuilder: (context, index) {
        final item = profileItems[index];
        return ListTile(
          leading: Icon(item['icon'], color: item['color']),
          title: CustomTextWidget(
            text: item['title'],
            fontWeight: FontWeight.w500,
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: () {},
        );
      },
      separatorBuilder: (context, index) => const Divider(height: 16),
    );
  }

  Widget _buildLogoutButton() {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red),
      title: const CustomTextWidget(
        text: 'Logout',
        fontWeight: FontWeight.w500,
        color: Colors.red,
      ),
      onTap: () {},
    );
  }
}

final List<Map<String, dynamic>> profileItems = [
  {'icon': Icons.shopping_bag_outlined, 'title': 'Orders'},
  {'icon': Icons.subscriptions_outlined, 'title': 'Subscriptions'},
  {'icon': CupertinoIcons.bell, 'title': 'Notifications'},
  {'icon': Icons.location_on_outlined, 'title': 'Addresses'},
  {'icon': Icons.favorite_border, 'title': 'Wishlist'},
  {'icon': Icons.edit_calendar_outlined, 'title': 'Edit Profile'},
  {'icon': Icons.card_giftcard, 'title': 'Refer and earn'},
  {'icon': Icons.share, 'title': 'Share the app'},
  {'icon': Icons.star_border, 'title': 'Rate the app'},
  {'icon': Icons.report_gmailerrorred, 'title': 'Report an issue'},
];
