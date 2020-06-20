# Green Scanner

A Gamified App on Android/iOS to encourage users to minimize Carbon Emission for JunctionX 2020.

Our aim is to motivate Singaporeans and merchants to adopt conservative measures towards carbon emissions, through the development of a software that raises awareness and tracks carbon emission from products consumed daily. Through gamification, users can turn the amount of carbon footprint saved into rewards points in exchange for lifestyle rewards.  This in turn incentivises large corporations to develop products with minimal carbon emission in mind,  while establishing a concrete position for Corporate Social Responsibility. Retailers would also be able track the carbon footprints of their products and strive towards mitigating the adverse effects on the environment.


# ScreenShots

<p align="center">
<img src="/screenshots/login.jpg" width="300" height="500"/>

<p align="center">
Login Screen For User Authentication

<p align="center">
<img src="/screenshots/home.jpg" width="300" height="500"/>
<p align="center">
Home Screen which display an animated tree (score), recommended purchases and dashboard for personal goals

<p align="center">
<img src="/screenshots/history.jpg" width="300" height="500"/>

<p align="center">
A history tab for previous purchase


<p align="center">
<img src="/screenshots/info.jpg" width="300" height="500"/>

<p align="center">
Within the history tab, displays additional information about the product's carbon emission

<p align="center">
<img src="/screenshots/rewards.jpg" width="300" height="500"/>

<p align="center">
Claimable environmentally friendly products/services listed by partners using the score system

<p align="center">
<img src="/screenshots/qrscan.jpg" width="300" height="500"/>

<p align="center">
QR Code Scanner

<p align="center">
<img src="/screenshots/prompt.jpg" width="300" height="500"/>

<p align="center">
Confirmation to redeem score


## Technology Stack

This is written in ```Flutter``` for export with iOS and Android. The backend consist of Azure's Services. Specifically

1. Azure SQL Database
2. Azure App Services
3. REST API

## Walkthrough

The following steps explain how the App is being used.

1. Customer creates an account and log in with their credentials
2. Customer have an overview of their current score/suggested purchases/dashboard of their personal goals. The animated tree corresponds to the current score of the user. There are 6 stages of scoring, 0-200 score shows a sapling, ... , 1000 score and aboves shows a full animated tree.
3. To view previous purchases and the carbon emission information regarding each product, it can be found in the History Tab.
4. To claim rewards, customer can select the rewards tab. Rewards listed are from GreenScanner partners, and the rewards are environmental friendly to encourage and instil low Carbon Emission decisions.
5. To increase your score, customer can open the camera application found in the App to scan a QR Barcode, of which is only being issued on purchased of the item.
6. Customer's will be more motivated to purchase less carbon emitted products which in return will cause corporations to produce less carbon emission products.

## Packages Used

#### Flutter:

Found in the [pubspec.yaml](./pubspec.yaml) file.

#### NodeJS:

```mySQL```
```ExpressJS```

## Future Plans

Implementation of Azure Auth Services and Data Analaytics on Carbon Emission Information via Azure's Services.

## Challenges

Within a short amount of time to build a full stack application, we had hardcoded some values and functions such as Authentication, which notably can be run on Azure's Auth Service.

The Database is not fully structured, we implemented the necessary fields.

We tested the App only on both Android Note 8, Android 9.0 and iOS Simulator iPhone 11, iOS 13.5 which is found to be fully functional.

