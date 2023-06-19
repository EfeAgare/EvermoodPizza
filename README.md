![example workflow](https://github.com/EfeAgare/EvermoodPizza/actions/workflows/test.yml/badge.svg)

# Pizza Order System
 A simple pizza order overview for a restaurant, where all pizza orders are listed, with the items they contain, their details and the total price. In addition, the system also enables you to mark an order as completed.

## Technologies
  * Ruby
  * Git
  * Rspec
  * Rubocop as Linter

## Setup
- Ensure you have [ruby](https://rvm.io/rvm/install) installed on your device

  ```
   Ruby = 3.0.0
  ```

  Clone this repository and cd into the clone specific folder and run the following command 
  accordingly

  ```
   bundle install
  ```

  ```
   yarn install
  ```

  ```
   rails db:create 
  ```

  ```
   rails db:migrate
  ```

  ```
  rails db:seed
  ```

  After to run server

  ```
  rails s
  ```

then visit 

```
http://127.0.0.1:3000

```

### Task Done
- Create the necessary data structures with postgres database following the provided data.
  
- Calculate the total_price for order, per each pizza requirement

- Once a order is completed it is no longer be displayed in the UI

- Create the required controller methods for display all orders and complete them

- Write spec test
