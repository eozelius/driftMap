# README

driftMaps.com integrates all the adventures of world exploration into an expressive cartographic experience.

* How does it work?
     - driftMaps.com is organized into <span>Journeys</span> and <span>Way Points.</span>  For example a trek across South America, will have many stops along the way in cities, towns or parks.

- What kind of stuff will a Way Point include?
    * Way Point content creation is organized into 3 categories: Photos, Friends and Journals.

- Interested in Contributing?
    * Great!  Take a look around, and send me an email.

# Technology Stack
 * Rails 5.1.2
 * Ruby 2.3.1
 * RSpec 3.6.0 - https://github.com/rspec/rspec
 * ReactJS with Webpacker
 * Postgres

# To get up a running
 1. database
    * configure config/database.yml
    ```
    $ rails db:create
    $ rails db:migrate
    $ rails db:seed
    ```
 2. React - guide: https://medium.com/react-on-rails/free-tutorial-how-to-use-react-with-webpacker-and-rails-5-1-92af8e8d9d63
    ```
    $ rails g webpacker:install - <requires yarnJS and nodeJS>
    $ rails g webpacker:verify_install
    $ rails g webpacker:react:install
    ```
 * Start Server
    ```
    $ ./bin/webpacker-dev-server - <starts assets server>
    $ rails s
    ```

# To execute tests
    $ rspec