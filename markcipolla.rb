require 'rubygems'
require 'sinatra/base'
require 'coffee-script'
require 'sass'

class SassEngine < Sinatra::Base

  set :views,   File.dirname(__FILE__)    + '/assets/stylesheets'

  get '/stylesheets/*.css' do
    filename = params[:splat].first
    sass filename.to_sym
  end

end

class CoffeeEngine < Sinatra::Base

  set :views,   File.dirname(__FILE__)    + '/assets/javascripts'

  get "/javascripts/*.js" do
    filename = params[:splat].first
    coffee filename.to_sym
  end

end

class MarkCipolla < Sinatra::Base

  use SassEngine
  use CoffeeEngine

  set :views,   File.dirname(__FILE__)    + '/views'
  set :public,  File.dirname(__FILE__)    + '/public'

  get '/' do
    erb :index
  end

  if __FILE__ == $0
    MarkCipolla.run! :port => 4000
  end

end