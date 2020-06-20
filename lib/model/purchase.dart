import 'package:flutter/material.dart';

class Purchase {
  final String productID;
  final String item;
  final int carbonFootprint;
  final int pointsEarned; // max at 100
  final String imagePath; // to be replaced with image
  Purchase({this.productID, this.item, this.carbonFootprint, this.pointsEarned, this.imagePath});

  // to be entered into database
  // final wl1 = Purchase(productID: 'wl1', item: "Washing Liquid - Brand A", carbonFootprint: 80, pointsEarned: 20, image: Icon(Icons.shopping_basket));
  // final wl2 = Purchase(productID: 'wl2', item: "Washing Liquid - Brand B", carbonFootprint: 50, pointsEarned: 70, image: Icon(Icons.shopping_basket));
  // final wl3 = Purchase(productID: 'wl3', item: "Washing Liquid - Brand C", carbonFootprint: 100, pointsEarned: 0, image: Icon(Icons.shopping_basket));

  Purchase getPurchase(String productID) {
    if (productID == 'wl1') {
      return Purchase(productID: 'wl1', item: "Washing Liquid - Brand A (Average CF)", carbonFootprint: 850, pointsEarned: 50, imagePath: "assets/wlA.jpg");
    }
    if (productID == 'wl2') {
      return Purchase(productID: 'wl2', item: "Washing Liquid - Brand B (High CF)", carbonFootprint: 1000, pointsEarned: 0, imagePath: "assets/wlB.jpg");
    } 
    if (productID == 'wl3') {
      return Purchase(productID: 'wl3', item: "Washing Liquid - Brand C (Low CF)", carbonFootprint: 700, pointsEarned: 100, imagePath: "assets/wlC.jpg");
    }
    if (productID == 'b1') {
      return Purchase(productID: 'b1', item: "Loaf of Bread - Brand A (Average CF)", carbonFootprint: 1000, pointsEarned: 50, imagePath: "assets/b1.jpg");
    } 
    if (productID == 'b2') {
      return Purchase(productID: 'b2', item: "Loaf of Bread - Brand B (Moderately High CF)", carbonFootprint: 1200, pointsEarned: 25, imagePath: "assets/b2.jpg");
    }  
    if (productID == 'b3') {
      return Purchase(productID: 'b3', item: "Loaf of Bread - Brand C (High CF)", carbonFootprint: 1500, pointsEarned: 0, imagePath: "assets/b3.jpg");
    } 
    if (productID == 'b4') {
      return Purchase(productID: 'b4', item: "Loaf of Bread - Brand D (Low CF)", carbonFootprint: 1000, pointsEarned: 1000, imagePath: "assets/b4.jpg");
    } 
    if (productID == 'r1') {
      return Purchase(productID: 'r1', item: "5kg Sack of Rice - Brand A (Average CF)", carbonFootprint: 20000, pointsEarned: 50, imagePath: "assets/r1.jpg");
    } 
    if (productID == 'r2') {
      return Purchase(productID: 'r2', item: "5kg Sack of Rice - Brand B (High CF)", carbonFootprint: 30000, pointsEarned: 0, imagePath: "assets/r2.jpg");
    } 
    if (productID == 'r3') {
      return Purchase(productID: 'r3', item: "5kg Sack of Rice - Brand C (Moderately Low CF)", carbonFootprint: 17000, pointsEarned: 75, imagePath: "assets/r3.jpg");
    } 
    if (productID == 'r4') {
      return Purchase(productID: 'r4', item: "5kg Sack of Rice - Brand D (Low CF)", carbonFootprint: 15000, pointsEarned: 1000, imagePath: "assets/r4.jpg");
    } 
  }
}

// Washing Liquid - Brand A, B, C
// For each brand, have a unique productID
// receipt will have date and list of productID
// based on product ID, retrieve information from purchases database

