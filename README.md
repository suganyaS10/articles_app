Articles App consumes olio v4 json API and lists the articles. Users can like an article.


|               | Versions      |
| ------------- | ------------- |
| Ruby          | 3.0.4         |
| Rails         | 6.1.7         |
| SqLite3       | 1.4        |


* System dependencies

  This code was written and tested in Ubuntu 22.04

* Set Up

  Run `bin/setup`

  This should take care of bundle install, DB creation and migration

* How to run the test suite

    To run the complete test suite, use the below command

     `rspec`


* How to start the server

   Run > `rails s`

   ![Application UI](/assets/images/app_ui.png)



* Known Issues

   1. article likes count is stored and read from local database. The reactions[:likes] from the API JSON is not used to display / the likes count is not updated in the API server
   2. Bootstrap is not installed properly due to some system issue. Hence used it directly using hyperlink to bootstrap just for the purpose of this test