import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oak_assignment/constants.dart';
import '../components/categoryTile.dart';
import '../components/couponTile.dart';
import '../components/defaultMenuTile.dart';
import '../components/imageTitleTile.dart';
import '../components/imgTextCard.dart';
import '../components/navIcon.dart';
import '../components/serviceTile.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'Home Screen';
  String userName;
  HomeScreen({super.key, this.userName = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.yellow.shade400),
          ),
          child: Container(
            height: 51,
            width: 51,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: kPrimaryColor),
            child: SvgPicture.asset(
              'assets/svg/logo.svg',
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavIcon(
              icon: 'assets/svg/home.svg',
              title: 'Home',
              isActive: true,
            ),
            NavIcon(
              icon: 'assets/svg/wishlist.svg',
              title: 'Wishlist',
            ),
            const SizedBox(
              width: 20,
            ),
            NavIcon(
              icon: 'assets/svg/orders.svg',
              title: 'Orders',
            ),
            NavIcon(
              icon: 'assets/svg/profile.svg',
              title: 'Profile',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // Main Column
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    Text(
                      'Hi, $userName!',
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Current location',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF7B7B7B)),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(children: [
                                SvgPicture.asset('assets/svg/location.svg'),
                                const SizedBox(
                                  width: 2,
                                ),
                                const Text(
                                  'Hydrabad',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/video.svg'),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              'How it works?',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),

              // Coupon Section
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CouponTile(
                        cardTitle:
                            'Enjoy your first \norder, the taste of \nour delicious food!',
                        bgImgLoc: 'assets/images/top_view_food1.png',
                        couponCode: 'FIRSTPLATE01',
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      CouponTile(
                        cardTitle: 'Delicious food  \nfor happy life',
                        bgImgLoc: 'assets/images/top_view_food1.png',
                        couponCode: 'FIRSTPLATE01',
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.87,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(10),
                              child: const TextField(
                                decoration: InputDecoration(
                                    hintText: 'Search food or events',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                    border: InputBorder.none),
                              ),
                            ),
                            Positioned(
                                right: 15,
                                top: 15,
                                child:
                                    SvgPicture.asset('assets/svg/search.svg')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Start Crafing Section
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Start crafting',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageTitleTile(
                            title: 'Default Platters',
                            imagePath: 'assets/images/default_platter.png',
                          ),
                          ImageTitleTile(
                            title: 'Craft Your Own',
                            imagePath: 'assets/images/craft_your_own.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              // Default menu list tiles
              SingleChildScrollView(
                padding: const EdgeInsets.all(2),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DefaultMenuTille(
                      title: 'Default Menu 1',
                    ),
                    DefaultMenuTille(
                      title: 'Default Menu 2',
                    ),
                    DefaultMenuTille(
                      title: 'Default Menu 2',
                    ),
                    DefaultMenuTille(
                      title: 'Default Menu 2',
                    ),
                    DefaultMenuTille(
                      title: 'Default Menu 1',
                    ),
                  ],
                ),
              ),

              // Top Category
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Top Categories',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryTile(
                            imagePath: 'assets/images/starters.png',
                            title: 'Starters',
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          CategoryTile(
                            imagePath: 'assets/images/drinks.png',
                            title: 'Drinks',
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          CategoryTile(
                            imagePath: 'assets/images/rice.png',
                            title: 'Rice',
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          CategoryTile(
                            imagePath: 'assets/images/curry.png',
                            title: 'Curry',
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          CategoryTile(
                            imagePath: 'assets/images/dessert.png',
                            title: 'Desserts',
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          CategoryTile(
                            imagePath: 'assets/images/starter1.png',
                            title: 'Starters',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Starters
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Starters',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Text(
                          'More Starters',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/grill_chicken.png',
                              title: 'Grill Chicken'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/mashroom.png',
                              title: 'Mashroom Fry'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/veg.png',
                              title: 'Veggies Fry'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/grill_chicken.png',
                              title: 'Grill Chicken'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/grill_chicken.png',
                              title: 'Grill Chicken'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/grill_chicken.png',
                              title: 'Grill Chicken'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/grill_chicken.png',
                              title: 'Grill Chicken'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),

              // Main Course
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Main Course',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Text(
                          'More Main Course',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/biryani.png',
                              title: 'Biryani'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/bread.png',
                              title: 'Bread'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/plain_rice.png',
                              title: 'Plain Rice'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/grill_chicken.png',
                              title: 'Grill Chicken'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/grill_chicken.png',
                              title: 'Grill Chicken'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/grill_chicken.png',
                              title: 'Grill Chicken'),
                          const SizedBox(
                            width: 10,
                          ),
                          ImageTitleTile(
                              height: 106,
                              width: 120,
                              imagePath: 'assets/images/grill_chicken.png',
                              title: 'Grill Chicken'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // services
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Services',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ServicesTile(
                            img: 'assets/images/services1.png',
                            icon: 'assets/images/signature_badge.png',
                            title: 'Signature',
                            b1: 'High Quality Disposable Cutlery',
                            b2: 'Elegant Decorations & Table Settings',
                            b3: 'Served by Waitstaff',
                            b4: 'Best for Weddings, Corporate Events etc',
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ServicesTile(
                            img: 'assets/images/value.png',
                            icon: 'assets/images/value_badge.png',
                            title: 'Value',
                            b1: 'Disposable Cutlery',
                            b2: 'Basic Decorations & Table Settings',
                            b3: 'Served in Buffet Style',
                            b4: 'Best for Birthdays, Family Gathering etc',
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ServicesTile(
                            img: 'assets/images/luxury.png',
                            icon: 'assets/images/luxury_badge.png',
                            title: 'Luxury',
                            b1: 'High End Reusable Cutlery',
                            b2: 'Elegant Decorations & Table Settings',
                            b3: 'Served by Professional Waitstaff',
                            b4: 'Best for Celebrity Parties, Political Events etc',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'How does it work ?',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ImgTextCard(
                        title: 'Customize Menu',
                        body:
                            'Select items for a single event or multiple events',
                        img: 'assets/svg/customized_menu.svg',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ImgTextCard(
                        bodyHeight: 5,
                        isSwapped: true,
                        title: 'Choose Services',
                        body:
                            'Select the type of services from varying cutlery, mode of serving options, & more',
                        img: 'assets/svg/choose_services.svg',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ImgTextCard(
                        isSmallImg: true,
                        bodyHeight: 5,
                        title: 'Dynamic Pricing',
                        body:
                            'Price per plate varies with no. of items in a plate and no. of plates selected',
                        img: 'assets/svg/dynamic_pricing.svg',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ImgTextCard(
                        bodyHeight: 5,
                        isSwapped: true,
                        title: 'Track Your Order',
                        body:
                            'Track the order status and seek help from the executives anytime',
                        img: 'assets/svg/track_order.svg',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ImgTextCard(
                        bodyHeight: 5,
                        isSmallImg: true,
                        title: 'Taste Your Samples',
                        body:
                            'Explode your taste bud with samples of what you order(on request for eligible orders)',
                        img: 'assets/svg/taste_sample.svg',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ImgTextCard(
                        bodyHeight: 5,
                        isSwapped: true,
                        title: 'Enjoy Food and Services',
                        body: 'Enjoy event with delicious and customized food',
                        img: 'assets/svg/enjoy_food.svg',
                      ),
                    ],
                  ),
                ),
              ),

              //Footer
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                color: Color(0xFFF8F8F8),
                child: const Text(
                  'Delicious food with professional service !',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ), // Main Column
        ),
      ),
    );
  }
}
