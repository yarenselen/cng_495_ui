// Profile page for the app. This is the page that the user sees when they click on their profile icon.
// Users can view their profile information and edit their profile information.
// Users can also delete their account from this page.
// Get the user's profile information from the database and display it on the page.
// Use profileInfo.dart to get the user's profile information from the database.
// Following fields are displayed on the page:
// Name
// Email
// Password
// Age
// Sign up date
// Users can edit their profile information by clicking on the edit button.
// Users can delete their account by clicking on the delete button.
// Users can log out by clicking on the log out button.
// Fields that are editable:
// Name
// password
// Age
// Users can save their changes by clicking on the save button.
// Users can cancel their changes by clicking on the cancel button.
// Fields that are not editable:
// Email
// Sign up date
// Fields are validated before saving the changes.
// Fields will be left alligned on the page.
// Fields will be displayed in the following order:
// Name
// Email
// Password
// Age
// Sign up date
// Buttons will be displayed in the following order:
// Edit
// Delete
// Log out
// Save
// Cancel

import 'package:flutter/material.dart';
import 'package:cng_495_ui/model/profileInfo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 3;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });

      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/login');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/reports');
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/notifications');
          break;
        case 3:
          Navigator.pushReplacementNamed(context, '/profile');
          break;
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Profile Info'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20.0),
            const Center(
              child: Text('Profile',
                  style: TextStyle(fontSize: 30.0, color: Colors.brown)),
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Name',
                style: TextStyle(fontSize: 20.0, color: Colors.brown),
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Container(
                width: 300,
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Email',
                style: TextStyle(fontSize: 20.0, color: Colors.brown),
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Container(
                width: 300,
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Age',
                style: TextStyle(fontSize: 20.0, color: Colors.brown),
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Container(
                width: 300,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Age',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_rounded),
            label: 'Market',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black87,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        backgroundColor: Colors.black87,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:cng_495_ui/model/profileInfo.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final _formKey = GlobalKey<FormState>();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     int _selectedIndex = 3;

//     void _onItemTapped(int index) {
//       setState(() {
//         _selectedIndex = index;
//       });

//       switch (index) {
//         case 0:
//           Navigator.pushReplacementNamed(context, '/login');
//           break;
//         case 1:
//           Navigator.pushReplacementNamed(context, '/market');
//           break;
//         case 2:
//           Navigator.pushReplacementNamed(context, '/notifications');
//           break;
//         case 3:
//           Navigator.pushReplacementNamed(context, '/profile');
//           break;
//       }
//     }

//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: const Text('Profile'),
//         centerTitle: true,
//       ),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           children: <Widget>[
//             const SizedBox(height: 20.0),
//             const Center(
//               child: Text(
//                 'Profile',
//                 style: TextStyle(fontSize: 30.0, color: Colors.green),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             const Center(
//               child: Text(
//                 'Name',
//                 style: TextStyle(fontSize: 20.0, color: Colors.green),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             Center(
//               child: Container(
//                 width: 300,
//                 child: TextFormField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Name',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             const Center(
//               child: Text(
//                 'Email',
//                 style: TextStyle(fontSize: 20.0, color: Colors.green),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             Center(
//               child: Container(
//                 width: 300,
//                 child: TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Email',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             const Center(
//               child: Text(
//                 'Password',
//                 style: TextStyle(fontSize: 20.0, color: Colors.green),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             Center(
//               child: Container(
//                 width: 300,
//                 child: TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             const Center(
//               child: Text(
//                 'Confirm Password',
//                 style: TextStyle(fontSize: 20.0, color: Colors.green),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             Center(
//               child: Container(
//                 width: 300,
//                 child: TextFormField(
//                   controller: _confirmPasswordController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Confirm Password',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please confirm your password';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Processing Data')),
//                     );
//                   }
//                 },
//                 child: const Text('Submit'),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             backgroundColor: Colors.black87,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.show_chart_rounded),
//             label: 'Market',
//             backgroundColor: Colors.black87,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Notifications',
//             backgroundColor: Colors.black87,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//             backgroundColor: Colors.black87,
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.green,
//         onTap: _onItemTapped,
//         backgroundColor: Colors.black87,
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// // class ProfilePage extends StatefulWidget {
// //   const ProfilePage({Key? key}) : super(key: key);

// //   @override
// //   State<ProfilePage> createState() => _ProfilePageState();
// // }

// // class _ProfilePageState extends State<ProfilePage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _scaffoldKey = GlobalKey<ScaffoldState>();

// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   final TextEditingController _confirmPasswordController =
// //       TextEditingController();

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _emailController.dispose();
// //     _passwordController.dispose();
// //     _confirmPasswordController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     int _selectedIndex = 3;

// //     void _onItemTapped(int index) {
// //       setState(() {
// //         _selectedIndex = index;
// //       });

// //       switch (index) {
// //         case 0:
// //           Navigator.pushReplacementNamed(context, '/login');
// //           break;
// //         case 1:
// //           Navigator.pushReplacementNamed(context, '/market');
// //           break;
// //         case 2:
// //           Navigator.pushReplacementNamed(context, '/notifications');
// //           break;
// //         case 3:
// //           Navigator.pushReplacementNamed(context, '/profile');
// //           break;
// //       }
// //     }

// //     return Scaffold(
// //       key: _scaffoldKey,
// //       appBar: AppBar(
// //         title: const Text('Profile'),
// //         centerTitle: true,
// //       ),
// //       body: Form(
// //         key: _formKey,
// //         child: ListView(
// //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //           children: <Widget>[
// //             const SizedBox(height: 24.0),
// //             TextFormField(
// //               controller: _nameController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Name',
// //               ),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter your name';
// //                 }
// //                 return null;
// //               },
// //             ),
// //             const SizedBox(height: 24.0),
// //             TextFormField(
// //               controller: _emailController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Email',
// //               ),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter your email';
// //                 }
// //                 return null;
// //               },
// //             ),
// //             const SizedBox(height: 24.0),
// //             TextFormField(
// //               controller: _passwordController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Password',
// //               ),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter your password';
// //                 }
// //                 return null;
// //               },
// //             ),
// //             const SizedBox(height: 24.0),
// //             TextFormField(
// //               controller: _confirmPasswordController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Confirm Password',
// //               ),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please confirm your password';
// //                 }
// //                 return null;
// //               },
// //             ),
// //             const SizedBox(height: 24.0),
// //             ElevatedButton(
// //               onPressed: () {
// //                 if (_formKey.currentState != null &&
// //                     _formKey.currentState!.validate()) {
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     const SnackBar(
// //                       content: Text('Processing Data'),
// //                     ),
// //                   );
// //                 }
// //               },
// //               child: const Text('Submit'),
// //             ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         items: const <BottomNavigationBarItem>[
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.home),
// //             label: 'Home',
// //             backgroundColor: Colors.black87,
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.show_chart_rounded),
// //             label: 'Market',
// //             backgroundColor: Colors.black87,
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.notifications),
// //             label: 'Notifications',
// //             backgroundColor: Colors.black87,
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.person),
// //             label: 'Profile',
// //             backgroundColor: Colors.black87,
// //           ),
// //         ],
// //         currentIndex: _selectedIndex,
// //         selectedItemColor: Colors.green,
// //         onTap: _onItemTapped,
// //         backgroundColor: Colors.black87,
// //       ),
// //     );
// //   }
// // }
