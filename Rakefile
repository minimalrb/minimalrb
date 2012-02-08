task 'assets:precompile' do
  require './app'
  
  dir = 'public/assets'
  
  FileUtils.rm_rf(dir, secure: true)
  Sprockets::StaticCompiler.new($assets, 'public/assets', ['*']).compile
end