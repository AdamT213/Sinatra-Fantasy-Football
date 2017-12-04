class PlayersController < ApplicationController

  get '/players/new' do
    if is_logged_in?
      erb :'/players/create_player'
    else
      erb :index
    end
  end

  post '/players' do
    if !params[:name].empty? && !params[:position].empty? && !params[:status].empty?
      @player = Player.create(params)
      @player.save
      redirect to "/teams/#{@team.id}"
    else
      redirect to '/players/new'
    end
  end

  # get '/teams/:id' do
  #   @team = Team.find_by_id(params[:id])
  #   erb :'/teams/show_team'
  # end
  #
  # delete '/teams/:id/delete' do
  #   if is_logged_in?
  #     @team = Team.find_by_id(params[:id])
  #     if @team.user.id == current_user.id
  #       @team.delete
  #       @team.league.users.delete(current_user)
  #       redirect to '/leagues'
  #     else
  #       redirect to '/leagues'
  #     end
  #   else
  #     erb :index
  #   end
  # end
end
