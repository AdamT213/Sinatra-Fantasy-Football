class GamesController < ApplicationController

  get '/games/new' do
    if is_logged_in?
      if current_league.teams.count >= 2
        current_league.manager_id == current_user.id ? (erb :'/games/create_game') : (redirect to '/leagues')
      else
        redirect to '/teams/new'
      end
    else
      erb :index
    end
  end

  post '/games' do
    if !params[:winning_team_id].empty? && !params[:losing_team_id].empty?
      @game = Game.create(params)
      current_league.games << @game
      @game.save
      @winning_team = Team.find_by_id(params[:winning_team_id])
      @winning_team.win
      @losing_team = Team.find_by_id(params[:losing_team_id])
      @losing_team.lose
      redirect to "/leagues/#{current_league.id}"
    else
      redirect to '/games/new'
    end
  end
end
