import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/features/food_details/presentation/food_details.dart';
import 'package:template_flutter/helpers/ui_helpers.dart';
import '/common_widgets/custom_button.dart';
import '/common_widgets/custom_textform_field.dart';
import '/gen/colors.gen.dart';
import 'widgets/catagory.dart';
import 'widgets/meals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 1;

  final List<Map<String, String>> _categories = [
    {
      'label': 'Breakfast',
      'image': 'assets/images/breakfast.png',
    },
    {
      'label': 'Lunch',
      'image': 'assets/images/Lunch.png',
    },
    {
      'label': 'Dinner',
      'image': 'assets/images/Dinner.png',
    },
    {
      'label': 'Brunch',
      'image': 'assets/images/brunch.png',
    },
  ];

  final List<FoodDetails> _meals = [
    FoodDetails(
      title: 'Avocado Toast Delight',
      subtitle: 'Classic avocado toast with a gourmet twist, perfect for breakfast or brunch',
      imagePath: 'assets/images/home_1.png',
      time: '15 min',
      servings: '2',
      calories: '320',
      protein: '12g',
      carbs: '35g',
      fat: '18g',
      ingredientSections: [
        IngredientSection(
          title: 'Vegetables',
          items: [
            IngredientItem(name: 'Slices sourdough bread', quantity: '2 cups'),
            IngredientItem(name: 'Ripe avocado', quantity: '1 piece'),
            IngredientItem(name: 'Eggs', quantity: '2 piece'),
            IngredientItem(name: 'Cherry tomatoes', quantity: '2 kg'),
          ],
        ),
        IngredientSection(
          title: 'Fruits',
          items: [
            IngredientItem(name: 'Red pepper flakes', quantity: '2 kg'),
            IngredientItem(name: 'Salt and pepper', quantity: '2 kg'),
            IngredientItem(name: 'Olive oil', quantity: '4 cups'),
            IngredientItem(name: 'Fresh herbs', quantity: '2 cups'),
          ],
        ),
      ],
      instructions: [
        'Toast sourdough bread until golden brown.',
        'Mash the avocado and season with salt and pepper.',
        'Spread avocado on toast and top with sliced tomatoes.',
        'Cook eggs to your preferred doneness and add on top.',
        'Drizzle olive oil and sprinkle red pepper flakes.',
        'Garnish with fresh herbs and serve immediately.',
        'Enjoy your breakfast with a slice of lemon on the side.',
      ],
    ),
    FoodDetails(
      title: 'Colorful Buddha Bowl',
      subtitle: 'A vibrant bowl packed with fresh veggies, grains, and protein.',
      imagePath: 'assets/images/home_2.png',
      time: '18 min',
      servings: '2',
      calories: '320',
      protein: '15g',
      carbs: '42g',
      fat: '14g',
      ingredientSections: [
        IngredientSection(
          title: 'Vegetables',
          items: [
            IngredientItem(name: 'Quinoa', quantity: '1 cup'),
            IngredientItem(name: 'Mixed greens', quantity: '2 cups'),
            IngredientItem(name: 'Cucumber slices', quantity: '1 cup'),
            IngredientItem(name: 'Carrots', quantity: '1 cup'),
          ],
        ),
        IngredientSection(
          title: 'Toppings',
          items: [
            IngredientItem(name: 'Chickpeas', quantity: '1 can'),
            IngredientItem(name: 'Avocado', quantity: '1 piece'),
            IngredientItem(name: 'Tahini sauce', quantity: '3 tbsp'),
            IngredientItem(name: 'Sesame seeds', quantity: '1 tsp'),
          ],
        ),
      ],
      instructions: [
        'Cook quinoa until fluffy and set aside.',
        'Place mixed greens in a large bowl.',
        'Add veggies, chickpeas, and avocado.',
        'Drizzle tahini sauce over everything.',
        'Sprinkle sesame seeds and toss gently.',
        'Serve chilled with a wedge of lemon.',
        'Enjoy the colorful, nourishing bowl.',
      ],
    ),
    FoodDetails(
      title: 'Spicy Veggie Salad',
      subtitle: 'A zesty salad loaded with crunchy vegetables and bold flavors.',
      imagePath: 'assets/images/home_3.png',
      time: '12 min',
      servings: '2',
      calories: '280',
      protein: '10g',
      carbs: '22g',
      fat: '10g',
      ingredientSections: [
        IngredientSection(
          title: 'Salad Mix',
          items: [
            IngredientItem(name: 'Romaine lettuce', quantity: '2 cups'),
            IngredientItem(name: 'Cherry tomatoes', quantity: '1 cup'),
            IngredientItem(name: 'Red onion', quantity: '1 piece'),
            IngredientItem(name: 'Bell peppers', quantity: '1 cup'),
          ],
        ),
        IngredientSection(
          title: 'Dressing',
          items: [
            IngredientItem(name: 'Olive oil', quantity: '2 tbsp'),
            IngredientItem(name: 'Lime juice', quantity: '1 tbsp'),
            IngredientItem(name: 'Chili flakes', quantity: '1 tsp'),
            IngredientItem(name: 'Salt and pepper', quantity: 'to taste'),
          ],
        ),
      ],
      instructions: [
        'Chop all vegetables into bite-sized pieces.',
        'Mix olive oil, lime juice, and chili flakes.',
        'Toss vegetables with the dressing.',
        'Season with salt and pepper.',
        'Let the salad sit for 2 minutes.',
        'Serve in a large bowl with fresh herbs.',
        'Enjoy the spicy, crunchy salad.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 24.h,
            bottom: 110.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning!',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.c000000,
                          ),
                        ),
                        UIHelper.verticalSpace(4.h),
                        Text(
                          'What would you like to cook today?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF8A8A8A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 52.w,
                    height: 52.w,
                    decoration: BoxDecoration(
                      color: AppColors.cFFFFFF.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.notifications_none,
                      size: 26.sp,
                      color: AppColors.c000000,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(24.h),
              CustomTextFormField(
                hintText: 'Search for meals',
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.c000000.withValues(alpha: 0.5),
                  size: 25.sp,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 18.h),
              ),
              UIHelper.verticalSpace(24.h),
              SizedBox(
                height: 50.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => UIHelper.horizontalSpace(14.w),
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    return CategoryCard(
                      label: category['label']!,
                      imagePath: category['image']!,
                      selected: _selectedCategory == index,
                      onTap: () {
                        setState(() {
                          _selectedCategory = index;
                        });
                      },
                    );
                  },
                ),
              ),
              UIHelper.verticalSpace(28.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/home_view_plan_background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.all(22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Text(
                        'New',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.cFFFFFF,
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(18.h),
                    Text(
                      'Healthy Weekly Plan',
                      style: TextFontStyle.textStyle20cFFFFFFOpenSans700,
                    ),
                    UIHelper.verticalSpace(8.h),
                    Text(
                      '7 day meal plan for a healthier you',
                      style: TextFontStyle.textStyle14cFFFFFFOpenSans400,
                    ),
                    UIHelper.verticalSpace(18.h),
                    CustomButton(
                      label: 'View Plan',
                      onPressed: () {},
                      width: 112.w,
                      height: 40.h,
                      borderRadius: 5000.r,
                      gradient: const LinearGradient(
                        colors: [AppColors.cFFFFFF, AppColors.cFFFFFF],
                      ),
                      textStyle: TextStyle(
                        color: AppColors.c05AD6E,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(29.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _meals.map((meal) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: MealCard(
                      title: meal.title,
                      imagePath: meal.imagePath,
                      calories: meal.calories,
                      duration: meal.time,
                      isFavorite: false,
                      onFavoriteTap: () {},
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FoodDetailsScreen(details: meal),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
