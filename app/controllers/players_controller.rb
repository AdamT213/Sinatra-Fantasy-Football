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

  get '/players/:id' do
    @player = Player.find_by_id(params[:id])
    erb :'/players/show_player'
  end

  delete '/players/:id/delete' do
    if is_logged_in?
      @player = Player.find_by_id(params[:id])
      if @player.user.id == current_user.id
        @player.delete
        redirect to "/teams/#{@team.id}"
      else
        redirect to "/teams/#{@team.id}"
      end
    else
      erb :index
    end
  end
end
