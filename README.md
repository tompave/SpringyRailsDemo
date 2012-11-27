#SpringyRailsDemo
This is a very basic Ruby on Rails 3.2.9 app to demonstrate how to use a canvas network graph with Ruby to represent Rails' ActiveRecord associations.

The JavaScript data model to store the graph nodes, the HTML5 canvas drawing code (with a couple of edits), and everything else canvas-related is taken from the excellent [Springy Algorithm](https://github.com/dhotson/springy) by Dennis Hotson.

This demo is meant as an example of how to transform your models and your associations into a set of variables you can work with, and how to integrate these variables with the drawing Javascript code in the view.

The random names are provided by the [Faker Gem](http://faker.rubyforge.org/) by Benjamin Curtis.

##Partials
Partials for the **has\_and\_belongs\_to\_many** and the **has_many :through** associations are kept separate although quite similar to make it easier to identify the pattern.  
If one desires, it would be easy to use just one partial with a couple of conditional statements.  

##Demo
You can see it in action [here](https://github.com/tompave/SpringyRailsDemo). It's on the Heroku free plan, so be patient if it takes a few seconds to wake up.