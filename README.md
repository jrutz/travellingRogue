# Travelling Rogue Application 
### What Is
- This application is a simple list of coffee shops around the dallas area. It displays the hours of operation, the address, and a map to the coffee shop. It also gives logged in users the opportunity to 'like' the coffee shop's page on Facebook.

### Ideal User
- The ideal user lives in Dallas 
- Is looking for new coffee places to check out
- May forget where he/she has been, uses GPS on a regular basis
- Wants a simple list to refer to when making plans or looking for a place to go

EC

- More than 1 API (Apiary and Facebook) https://github.com/jrutz/travellingRogue/blob/master/travellingRogue/LoginViewController.m#L37-43
- Functioning login screen (through Facebook) https://github.com/jrutz/travellingRogue/blob/master/travellingRogue/LoginViewController.m#L37
- Functioning sign up (through Facebook) https://github.com/jrutz/travellingRogue/blob/master/travellingRogue/LoginViewController.m#L37
	- Logging in /signing up gives you the opportunity to 'like' coffee shops 
	- Upon reopening the app after logging in, the app will display your name
- The user's username is persisted between launches https://github.com/jrutz/travellingRogue/blob/master/travellingRogue/LoginViewController.m#L43-61
- App does not save user location, but user location is used to generate directions if requested  https://github.com/jrutz/travellingRogue/blob/master/travellingRogue/detailViewController.m#L67



![Login Page](http://i.imgur.com/cg1Rd3O.png)

![Table View](http://i.imgur.com/vyZjwbZ.png)

![Top View of Detail View](http://i.imgur.com/09vw7pu.png)

![Scrolled View of Detail View](http://i.imgur.com/OJh9UHz.png)

