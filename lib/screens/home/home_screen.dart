import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/view_model/home_screen_view_model.dart';

import '../../models/Product.dart';
import '../details/details_screen.dart';
import 'components/categorries.dart';
import 'components/item_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: SvgPicture.asset("assets/icons/back.svg"),
      //     onPressed: () {},
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: SvgPicture.asset(
      //         "assets/icons/search.svg",
      //         colorFilter: ColorFilter.mode(kTextColor, BlendMode.srcIn),
      //       ),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //       icon: SvgPicture.asset(
      //         "assets/icons/cart.svg",
      //         colorFilter: ColorFilter.mode(kTextColor, BlendMode.srcIn),
      //       ),
      //       onPressed: () {},
      //     ),
      //     SizedBox(width: kDefaultPaddin / 2)
      //   ],
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Search Bar
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  // Search bar
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: 50,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          fillColor: Colors.grey[300], // Ash color
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Circular border
                            borderSide: BorderSide.none, // No border outline
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Circular border
                            borderSide: BorderSide.none, // No border outline
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(30), // Circular border
                              borderSide: BorderSide.none),
                          prefixIcon: const Icon(Icons.search),
                        ),
                        onChanged: (value) {
                          homeProvider.setSearchQuery(value);
                        },
                      ),
                    ),
                  ),

                  // Icon at the end
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300], // Background color of the icon
                      ),
                      padding: const EdgeInsets.all(
                          8), // Padding to adjust the size of the background
                      child: const Icon(
                        Icons.sort,
                        color: Colors.black, // Color of the icon
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: Text(
                  "Categories",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Categories(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: kDefaultPaddin,
                      crossAxisSpacing: kDefaultPaddin,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
