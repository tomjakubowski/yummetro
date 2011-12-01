# Load the rails application
require File.expand_path('../application', __FILE__)

# Load heroku vars from local file
heroku_env = File.expand_path('../heroku_env.rb', __FILE__)
load(heroku_env) if File.exists?(heroku_env)

# Initialize the rails application
Metro::Application.initialize!
