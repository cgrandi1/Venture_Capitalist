require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "My secret something"
  end

  get '/' do

    erb :index
  end

  helpers do
    def current_user
      Investor.find(session[:investor_id])
    end

    def is_logged_in?
      !!(session[:investor_id])
    end
  end

end
