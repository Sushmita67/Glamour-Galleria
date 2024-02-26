import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:online_book_store/FirebaseService.dart'; // Assuming you have FirebaseService for database interaction.
import 'package:online_book_store/models/product_model.dart';

void main() {
  test("Add Product", () async {
    // Create a product instance
    products productToAdd = products(
      id: 1,
      name: "name",
      category: "category",
      description: "description",
      image: "image",
      quantity: 2,
      price: 222,
    );

    // Set up the FakeFirestore database
    FakeFirebaseFirestore fakeFirestore = FakeFirebaseFirestore();

    // Set the Firestore instance in your service
    FirebaseService.db = fakeFirestore;

    // Add the product to the Firestore database
    await fakeFirestore.collection("products").doc("1").set(productToAdd.toMap());

    // Fetch the added product from the database
    var addedProductSnapshot = await fakeFirestore.collection("products").doc("1").get();

    // Convert the Firestore snapshot to a Product object
    products addedProduct = products(id: 2, name: "name", category: "category", description: "description", image: "image", quantity: 12, price: 123).FromMap(addedProductSnapshot.data() as Map<String, dynamic>);

    // Assert that the added product matches the original product
    expect(addedProduct.id, productToAdd.id);
    expect(addedProduct.name, productToAdd.name);
    expect(addedProduct.category, productToAdd.category);
    expect(addedProduct.description, productToAdd.description);
    expect(addedProduct.image, productToAdd.image);
    expect(addedProduct.quantity, productToAdd.quantity);
    expect(addedProduct.price, productToAdd.price);
  });
}

