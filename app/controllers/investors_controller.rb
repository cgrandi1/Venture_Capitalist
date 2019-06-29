class InvestorsController < ApplicationController

    get '/signup' do
      if !is_logged_in?
        erb :'/investors/signup'
      else
         redirect "/investments"
      end
    end
  
    post "/signup" do
      redirect 'investments' if is_logged_in?
      if params[:username] == "" || params[:email] == "" || params[:password] == ""
  
       redirect '/signup'
      else
        investor = Investor.create(params)
        session[:investor_id] = investor.id
        redirect '/investments'
      end
    end
  
    get '/login' do
      if !is_logged_in?
        erb :'/investors/login'
      else
        redirect "/investments"
      end 
    end
  
    post '/login' do
      @investor = Investor.find_by(email: params[:email])
      if @investor && @investor.authenticate(params[:password])
        session[:investor_id] = @investor.id
        @investor.save
        redirect '/investments'
      else
        redirect '/signup'
      end
    end
  
    get '/logout' do
      if !is_logged_in?
        redirect '/login'
      else
        session.clear
        redirect '/login'
      end
    end
  
  end