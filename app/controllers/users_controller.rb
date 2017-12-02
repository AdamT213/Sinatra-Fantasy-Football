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

  get '/login' do
    if !is_logged_in?
      erb :'/users/login'
    else
      redirect to '/leagues'
    end
  end

  post '/login' do
    @user = User.find_by(username: params["username"])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/leagues'
    else
      redirect to '/'
    end
  end

  get '/logout' do
    if is_logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params["slug"])
    erb :'/users/show'
  end
end
