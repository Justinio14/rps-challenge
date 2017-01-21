require 'sinatra/base'
# require './lib/player'
# require './lib/game'

class RPSWeb < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/selection' do
    session[:marketeer_name] = params[:marketeer_name]
    @marketeer = session[:marketeer_name]
    erb :selection
  end

  post '/game' do
    session[:choice] = params[:choice]
    redirect '/game'
  end

  get '/game' do
    @choice = session[:choice]
    erb :game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
