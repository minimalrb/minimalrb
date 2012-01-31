assets = Sprockets::Environment.new(root_path) do |env|
  env.logger = Logger.new(STDOUT)
end

%w[app lib vendor].each do |path|
  %w[fonts images javascripts stylesheets].each do |asset_path|
    assets.append_path(File.join(root_path, path, 'assets', asset_path))
  end
end

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