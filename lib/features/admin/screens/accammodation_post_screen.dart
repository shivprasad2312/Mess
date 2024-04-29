import 'package:flutter/material.dart';
import 'package:mess/common/widgets/loader.dart';
import 'package:mess/features/admin/screens/rent_add_products_screen.dart';
import 'package:mess/features/admin/service/admin_services.dart';
import 'package:mess/features/auth/widgets/single_product.dart';
import 'package:mess/models/product.dart';
import 'package:mess/models/rentProduct.dart';


class AccamodationPostScreen extends StatefulWidget {
  const AccamodationPostScreen({Key? key}) : super(key: key);

  @override
  State<AccamodationPostScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<AccamodationPostScreen> {
  List<RentProduct>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllRentProducts();
  }

  fetchAllRentProducts() async {
    products = await adminServices.fetchAllRentProducts(context);
    setState(() {});
  }

  void deleteRentProduct(RentProduct rentProduct, int index) {
    adminServices.deleteRentProduct(
      context: context,
      rentProduct: rentProduct,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddRentProduct() {
    Navigator.pushNamed(context, RentAddProductScreenAdmin.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productData = products![index];
                return Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProduct(
                          image: productData.images[0],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                productData.ownerName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            IconButton(
                              onPressed: () => deleteRentProduct(productData, index),
                              icon: const Icon(
                                Icons.delete_outline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: navigateToAddRentProduct,
              tooltip: 'Add a Product',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
