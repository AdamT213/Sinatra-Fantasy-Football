require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  helpers do
  def current_user
    @current_user ||=  User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    !!current_user
  end

  def current_league
    @current_league ||=  League.find_by(id: session[:league_id]) if session[:league_id]
  end

  def current_team
    @current_team ||=  Team.find_by(id: session[:team_id]) if session[:team_id]
  end
end

  get '/' do
    redirect to '/leagues'
  end
end
