class TeamsController < ApplicationController

  get '/teams/new' do
    if is_logged_in?
      erb :'/teams/create_team'
    else
      erb :index
    end
  end

  post '/teams' do
    if !params[:name].empty?
      @team = Team.create(params)
      @team.save
      redirect to "/teams/#{@team.id}"
    else
      redirect to '/teams/new'
    end
  end

  get '/teams/:id' do
    @team = Team.find_by_id(params[:id])
    erb :'/teams/show_team'
  end

  delete '/teams/:id/delete' do
    if is_logged_in?
      @team = Team.find_by_id(params[:id])
      if @team.user.id == current_user.id
        @team.delete
        @team.league.users.delete(current_user)
        redirect to '/leagues'
      else
        redirect to '/leagues'
      end
    else
      erb :index
    end
  end
end
