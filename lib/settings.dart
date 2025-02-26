import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spot_on_users/edit_profile.dart';
import 'package:spot_on_users/payment_details_screen.dart';
import 'package:spot_on_users/pofile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Settings state
  bool _notificationsEnabled = true;
  bool _locationEnabled = true;
  bool _darkModeEnabled = true;
  double _searchRadius = 5.0; // km
  String _selectedLanguage = 'English';
  String _selectedCurrency = 'USD';
  String _selectedPaymentMethod = 'Credit Card';

  final List<String> _languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese'
  ];
  final List<String> _currencies = ['USD', 'EUR', 'GBP', 'JPY', 'IND'];
  final List<String> _paymentMethods = [
    'Credit Card',
    'PayPal',
    'Apple Pay',
    'Google Pay',
    'Bank Transfer'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Color(0xFF9B49E6)),
            onPressed: () {
              _showAboutDialog();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),

          // Profile section
          _buildProfileSection(),

          // General settings section
          _buildSectionHeader('General'),
          _buildToggleSetting(
            'Dark Mode',
            'Switch between dark and light theme',
            Icons.dark_mode,
            _darkModeEnabled,
            (value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
          _buildToggleSetting(
            'Notifications',
            'Enable push notifications',
            Icons.notifications_none,
            _notificationsEnabled,
            (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          _buildToggleSetting(
            'Location Services',
            'Allow app to access your location',
            Icons.location_on_outlined,
            _locationEnabled,
            (value) {
              setState(() {
                _locationEnabled = value;
              });
            },
          ),

          // Search preferences section
          _buildSectionHeader('Search Preferences'),
          _buildSliderSetting(
            'Search Radius',
            '${_searchRadius.toInt()} km',
            Icons.radar,
            _searchRadius,
            1.0,
            10.0,
            (value) {
              setState(() {
                _searchRadius = value;
              });
            },
          ),

          // Language and region section
          _buildSectionHeader('Language & Region'),
          _buildDropdownSetting(
            'Language',
            'Select your preferred language',
            Icons.language,
            _selectedLanguage,
            _languages,
            (value) {
              if (value != null) {
                setState(() {
                  _selectedLanguage = value;
                });
              }
            },
          ),
          _buildDropdownSetting(
            'Currency',
            'Select your preferred currency',
            Icons.attach_money,
            _selectedCurrency,
            _currencies,
            (value) {
              if (value != null) {
                setState(() {
                  _selectedCurrency = value;
                });
              }
            },
          ),

          // Payment section
          _buildSectionHeader('Payment Methods'),
          _buildDropdownSetting(
            'Default Payment',
            'Select your default payment method',
            Icons.payment,
            _selectedPaymentMethod,
            _paymentMethods,
            (value) {
              if (value != null) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              }
            },
          ),
          _buildNavigationSetting(
            'Manage Payment Methods',
            'Add, remove or edit your payment options',
            Icons.credit_card,
            () {
              // Navigate to payment methods screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(),
                ),
              );
            },
          ),

          // Account section
          _buildSectionHeader('Account'),
          _buildNavigationSetting(
            'Personal Information',
            'Manage your personal details',
            Icons.person_outline,
            () {
              // Navigate to personal info screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
          _buildNavigationSetting(
            'Privacy Settings',
            'Manage your privacy preferences',
            Icons.lock_outline,
            () {
              // Navigate to privacy settings screen
              print('Navigate to privacy settings screen');
            },
          ),
          _buildNavigationSetting(
            'Parking History',
            'View your past parking bookings',
            Icons.history,
            () {
              // Navigate to parking history screen
              print('Navigate to parking history screen');
            },
          ),

          // Support section
          _buildSectionHeader('Support'),
          _buildNavigationSetting(
            'Help Center',
            'Get help with using the app',
            Icons.help_outline,
            () {
              // Navigate to help center
              print('Navigate to help center');
            },
          ),
          _buildNavigationSetting(
            'Contact Us',
            'Reach out to our support team',
            Icons.email_outlined,
            () {
              // Navigate to contact screen
              print('Navigate to contact screen');
            },
          ),

          // Danger zone
          _buildSectionHeader('Danger Zone', isWarning: true),
          _buildNavigationSetting(
            'Delete Account',
            'Permanently delete your account and data',
            Icons.delete_outline,
            () {
              _showDeleteAccountConfirmation();
            },
            isDestructive: true,
          ),

          // Version info
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'SpotOn v1.0.0',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF9B49E6),
                width: 2,
              ),
            ),
            child: Center(
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Color(0xFF9B49E6),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfile(),
                ),
              );
              // Navigate to edit profile
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool isWarning = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isWarning ? Colors.redAccent : const Color(0xFFFFDD59),
        ),
      ),
    );
  }

  Widget _buildToggleSetting(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    Function(bool) onChanged,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF9B49E6),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF9B49E6),
        activeTrackColor: const Color(0xFF9B49E6).withOpacity(0.3),
      ),
    );
  }

  Widget _buildSliderSetting(
    String title,
    String value,
    IconData icon,
    double sliderValue,
    double min,
    double max,
    Function(double) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: const Color(0xFF9B49E6),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Text(
            value,
            style: const TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color(0xFF9B49E6),
              inactiveTrackColor: const Color(0xFF2A2A2A),
              thumbColor: const Color(0xFF9B49E6),
              overlayColor: const Color(0xFF9B49E6).withOpacity(0.2),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
            ),
            child: Slider(
              value: sliderValue,
              min: min,
              max: max,
              divisions: (max - min).toInt(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownSetting(
    String title,
    String subtitle,
    IconData icon,
    String value,
    List<String> options,
    Function(String?) onChanged,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF9B49E6),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      trailing: DropdownButton<String>(
        value: value,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.white),
        dropdownColor: const Color(0xFF2A2A2A),
        underline: Container(
          height: 0,
        ),
        onChanged: onChanged,
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNavigationSetting(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? Colors.redAccent : const Color(0xFF9B49E6),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isDestructive ? Colors.redAccent : Colors.white,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: const Text('About SpotOn'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(height: 10),
              Text(
                'SpotOn is your go-to app for finding and booking parking spaces quickly and conveniently.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Version 1.0.0',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 5),
              Text(
                '© 2025 SpotOn Parking Ltd.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(color: Color(0xFF9B49E6)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountConfirmation() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: const Text(
            'Delete Account',
            style: TextStyle(color: Colors.redAccent),
          ),
          content: const Text(
            'Are you sure you want to delete your account? This action is permanent and all your data will be lost.',
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                // Handle account deletion
                print('Delete account action');
              },
            ),
          ],
        );
      },
    );
  }
}
