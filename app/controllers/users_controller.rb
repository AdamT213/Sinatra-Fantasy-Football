class UsersController < ApplicationController

  get '/signup' do
    if !is_logged_in
      erb :'/users/new'
    else
      redirect to '/leagues'
    end
  end
