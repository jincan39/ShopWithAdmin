#Shopify with rails_admin

## Running the App

* Once you have Ruby and Rails installed, clone the repo by running

  ```$ git clone https://github.com/jincan39/ShopWithAdmin.git```

* Then run the following command to install gem dependencies:

  ```$ bundle install```

* Then run the following command to set up the database:

  ```$ bundle exec rake db:migrate```

* Once the command runs successfully, start the Rails server by running:

  ```$ rails server```

* To access the app, visit http://localhost:3000 in a web browser


## Testing

* To test the web application, run the following command to carry out all tests:

  ```$ bundle exec rake spec```

* To view test descriptors, run the following command:

  ```$ bundle exec rake spec -fd```

