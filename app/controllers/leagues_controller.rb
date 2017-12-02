class LeaguesController < ApplicationController

  get '/leagues/new' do
    if is_logged_in?
      erb :'/leagues/create_league'
    else
      redirect to '/login'
    end
  end

  get '/leagues' do
    @leagues = League.all
    erb :'/leagues/leagues'
  end

  post '/leagues' do
    if !params[:name].empty?
      @league = League.create(params)
      @league.save
      redirect to "/leagues/#{@league.id}"
    else
      redirect to '/leagues/new'
    end
  end

  get '/leagues/:id' do
    @league = League.find_by_id(params[:id])
    erb :'/leagues/show_league'
  end

  delete '/leagues/:id/delete' do
    if is_logged_in?
      @league = League.find_by_id(params[:id])
      if @league.manager_id == current_user.id
        @league.delete
        redirect to '/leagues'
      else
        redirect to '/leagues'
      end
    else
      erb: index
    end
  end
