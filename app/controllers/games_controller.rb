class GamesController < ApplicationController

  get '/games/new' do
    if is_logged_in?
      erb :'/games/create_game'
    else
      erb :index
    end
  end

  post '/games' do
    if !params[:winning_team_id].empty? && !params[:losing_team_id].empty?
      @game = Game.create(params)
      @game.save
      redirect to "/leagues/#{@league.id}"
    else
      redirect to '/games/new'
    end
  end

  get '/games/:id' do
    @game = Game.find_by_id(params[:id])
    erb :'/games/show_game'
  end
end
