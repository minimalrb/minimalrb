require 'bundler'
Bundler.require


#ROOT_DIR = $0 unless defined? ROOT_DIR

ROOT_DIR = File.expand_path(File.dirname(__FILE__))

def root_path(*args)
  File.join(ROOT_DIR, *args)
end


# Load app files
Dir[root_path("app/*.rb")].each do |file|
  require file
end



get '/', :provides => 'html' do
	haml :index
end