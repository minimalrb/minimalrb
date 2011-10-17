assets = Sprockets::Environment.new(root_path) do |env|
  env.logger = Logger.new(STDOUT)
end

assets.append_path(File.join(root_path, 'app', 'assets'))
assets.append_path(File.join(root_path, 'app', 'assets', 'fonts'))
assets.append_path(File.join(root_path, 'app', 'assets', 'images'))
assets.append_path(File.join(root_path, 'app', 'assets', 'javascripts'))
assets.append_path(File.join(root_path, 'app', 'assets', 'stylesheets'))

module AssetHelpers
  def asset_path(name)
    "/assets/#{name}"
  end
end

assets.context_class.instance_eval do
  include AssetHelpers
end

get '/assets/*' do
  new_env = env.clone
  new_env["PATH_INFO"].gsub!("/assets", "")
  assets.call(new_env)
end