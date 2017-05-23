require 'bundler'
Bundler.require
require_relative 'models/model.rb'
class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/quiz' do
    erb :quiz
  end
  get '/home' do
    erb :index
  end
  get '/Dipercakes' do
    erb :index
  end
  get '/Corsages' do
    erb :index
  end
  post '/results' do 
    #pull information out of the params hash and save it in a new variable
    object=params[:object]
    para=params[:para]
    color=params[:color]
    if object != "corsage" && para == "n/a"
      @result_text="Click on the picture to go purchase this item"
    elsif object=="corsage" && para != "n/a"
      @result_text="Click on the picture to go purchase this item"
    else
      @result_text="You are receiving an error because you most likely didn't fill out the quiz correctly..."
    end
    @result_pic=reccomender(object, para, color)[0]
    @url=reccomender(object, para, color)[1]
    
     erb :results
  
  
  end
end