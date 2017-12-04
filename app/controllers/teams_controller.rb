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
