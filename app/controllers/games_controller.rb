class GamesController < ApplicationController

  get '/games/new' do
    if is_logged_in?
      if league.manager_id == current_user.id
        erb :'/games/create_game'
      else
        redirect to '/leagues'
    else
      erb :index
    end
  end

  post '/games' do
    if !params[:winning_team_id].empty? && !params[:losing_team_id].empty?
      @game = Game.create(params)
      @league.games << @game
      @game.save
      @winning_team = Team.find_by_id(params[:winning_team_id])
      @winning_team.wins += 1
      @losing_team = Team.find_by_id(params[:losing_team_id])
      @losing_team.losses += 1
      redirect to "/leagues/#{@league.id}"
    else
      redirect to '/games/new'
    end
  end
end
