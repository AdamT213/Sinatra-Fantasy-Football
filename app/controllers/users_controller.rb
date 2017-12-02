class UsersController < ApplicationController

  get '/signup' do
    if !is_logged_in?
      erb :'/users/new'
    else
      redirect to '/leagues'
    end
  end

  post '/signup' do
    if (params[:username]).empty? || (params[:email]).empty? || (params[:password]).empty?
      redirect to '/signup'
    else
      @user = User.create(params)
      @user.save
      session[:user_id] = @user.id
      redirect to '/leagues'
    end
  end
end
