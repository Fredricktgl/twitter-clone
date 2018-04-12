# Twitter clone

1) An attempt to do out my own version of Twitter. This app was done as training to more advanced ruby on rails concepts.
2) Git clone https://github.com/Fredricktgl/twitter-clone.git to your directory
3) Bundle install
4) Rake db:create db:migrate
5) Alternatively, you can view the live app here: https://alpha-camp-twitter.herokuapp.com/

# Known issues
1) User interface not optimized for different screen resolutions
2) Ajax issue with likes/dislikes
3) Logic error when editing tweets, it will create a new tweet instead of editing it.
4) In the live app, pictures will get "deleted" after 1 hour, displaying only the image path. This mainly is due to how     heroku works.
5) Mailer funtions (forget password and such.) was not setup for this app.
