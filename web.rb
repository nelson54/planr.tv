require 'rubygems'
require 'sinatra'  
require 'data_mapper'
require 'slim'

$LOAD_PATH << File.expand_path('models/')

require 'Tvshow'
require 'Season'
require 'Episode'

DataMapper.finalize

DataMapper.setup(:default, "sqlite3:///#{File.expand_path(File.dirname(__FILE__))}/db/planr.db")

configure do
  set :port, 8080
end  
  
get '/' do  
  slim :index 
end

get '/shows' do 
  @tvshows = Tvshow.all

  #puts tvshows.to_yaml

  slim :'/shows/view'
end

post '/shows/add' do
  show = Tvshow.new({:title => params[:title]})

  if show.save
    status(201)
    redirect '/shows'
  else
    halt 409, tag.errors.inspect
  end

end

get '/shows/add' do  
  slim :'/shows/add' 
end 