# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Functionality
Jungle is a shopping site where users can purchase items using a stripe payments system. Users do not need to be logged in to shop!

## Screenshots

### Home Page
!["Screenshot of homepage"](https://github.com/victoriamlee/jungle-rails/blob/master/docs/home-page.png)

### Apparel Category
!["Screenshot of apparel category"](https://github.com/victoriamlee/jungle-rails/blob/master/docs/apparel-category.png)

### Cart
!["Screenshot of empty cart"](https://github.com/victoriamlee/jungle-rails/blob/master/docs/empty-cart.png)
!["Screenshot of cart"](https://github.com/victoriamlee/jungle-rails/blob/master/docs/cart.png)

### Order Details
!["Screenshot of order details"](https://github.com/victoriamlee/jungle-rails/blob/master/docs/order-details.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
