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
