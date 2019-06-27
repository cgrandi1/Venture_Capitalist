class InvestmentsController < ApplicationController
    get '/investments' do
        if is_logged_in?
          @investments = Investment.all
          erb :'/investments/investments'
        else
          redirect '/login'
        end
      end
    
      get '/investments/new' do
        if is_logged_in?
          erb :'/investments/new'
        else
          redirect '/login'
        end
      end
    
      post '/investments/new' do
        redirect '/investments/new' if params[:company_name].empty? || params[:amount_invested].empty? || params[:years_until_return].empty?
        @investment = Investment.create(params)
        @investment.user = current_user
        @investment.save
        redirect '/investments/new'
      end
    
    
      get '/investments/:id' do
        redirect '/login' if !is_logged_in?
        @investment = Investment.find(params[:id])
        if current_user.investments.include?(@investment)
          erb :'/investments/show'
        else
          redirect '/login'
        end
      end
    
        get '/investments/:id/edit' do
          if is_logged_in?
            @investment = investment.find(params[:id])
            if @investment && @investment.user == current_user
    
              erb :'investments/edit'
            else
              redirect '/login'
            end
          else
            redirect '/login'
          end
        end
    
    
      patch '/investments/:id' do
        if is_logged_in?
          if params[:company_name] == "" || params[:amount_invested] == "" || params[:years_until_return] == ""
            redirect "/investments/#{params[:id]}/edit"
          else
            @investment = Investment.find(params[:id])
            if @investment && @investment.user == current_user
              @investment.update(company_name: params[:company_name], amount_invested: params[:amount_invested], years_until_return: params[:years_until_return])
              # @investment.save
              redirect "/investments/#{@investment.id}"
            else
              redirect '/investments'
            end
          end
        else
          redirect '/login'
        end
      end
    
      delete '/investments/:id' do
        if is_logged_in?
          @investment = Investment.find_by_id(params[:id])
          if @investment && @investment.user == current_user
            @investment.delete
            redirect to '/investments'
          else
            redirect to '/investments'
          end
        else
          redirect to '/login'
        end
      end

end 