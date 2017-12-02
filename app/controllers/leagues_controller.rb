class LeaguesController < ActiveRecord::Base

  get '/leagues/new' do
    if is_logged_in?
      erb :'/leagues/create_league'
    else
      redirect to '/login'
    end
  end
end
