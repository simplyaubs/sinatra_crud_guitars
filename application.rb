require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index, locals: { list_of_guitars: DB[:guitars].to_a }
  end

  get '/guitars/new' do
    erb :new
  end

  post '/guitars' do
    DB[:guitars].insert(maker: params[:maker], type: params[:type], color: params[:color])
    redirect '/'
  end

  get '/guitars/:id' do
    guitar_id = params[:id]
    erb :show, locals: { single_guitar: DB[:guitars][id: guitar_id] }
  end

  put '/guitars/:id' do
    guitar_id = params[:id]
    DB[:guitars].where(id: guitar_id).update(maker: params[:maker], type: params[:type], color: params[:color])
    redirect "/guitars/#{guitar_id}"
  end

end