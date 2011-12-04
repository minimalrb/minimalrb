require 'bundler'
Bundler.require
require 'sinatra/content_for'

# Set standard views path
set :views, settings.root + '/app/views'

# Define root path
ROOT_DIR = File.expand_path(File.dirname(__FILE__))
def root_path(*args)
  File.join(ROOT_DIR, *args)
end

# Load app files
Dir[root_path("app/*.rb")].each do |file|
  require file
end

# Load config files
Dir[root_path("config/*.rb")].each do |file|
  require file
end