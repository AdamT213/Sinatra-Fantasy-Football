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
      @team.manager_id = current_user.id
      @team.save
      redirect to "/teams/#{@team.id}"
    else
      redirect to '/teams/new'
    end
  end

#   get '/leagues/:id' do
#     @league = League.find_by_id(params[:id])
#     erb :'/leagues/show_league'
#   end
#
#   delete '/leagues/:id/delete' do
#     if is_logged_in?
#       @league = League.find_by_id(params[:id])
#       if @league.manager_id == current_user.id
#         @league.delete
#         redirect to '/leagues'
#       else
#         redirect to '/leagues'
#       end
#     else
#       erb :index
#     end
#   end
end
