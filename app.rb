class Whiskeys < Sinatra::Base

  # General route actions
  get '/' do
    erb :home
  end

  get '/about' do
    erb :about
  end

  # RESTful Artist Controller Actions
  # index
  get '/whiskeys' do
    @whiskeys = Whiskey.all
    erb(:"whiskeys/index")
  end

  # new
  get '/whiskeys/new' do
    @whiskeys = Whiskey.new
    erb(:"whiskeys/new")
  end

  # create
  post '/whiskeys' do
    @whiskey = Whiskey.new(params[:whiskey])
    if @whiskey.save
      redirect("/whiskeys/#{@whiskey.id}")
    else
      erb(:"whiskeys/new")
    end
  end

  # show
  get '/whiskeys/:id' do
    @whiskey = Whiskey.find(params[:id])
    erb(:"whiskeys/show")
  end

  # edit
  get '/whiskeys/:id/edit' do
    @whiskey = Whiskey.find(params[:id])
    erb(:"whiskeys/edit")
  end

  # update
  put '/whiskeys/:id' do
    @whiskey = Whiskey.find(params[:id])
    if @whiskey.update_attributes(params[:whiskey])
      redirect("/whiskeys/#{whiskey.id}")
    else
      erb(:"whiskeys/edit")
    end
  end

  # delete
  delete '/whiskeys/:id/delete' do
    @whiskey = Whiskey.find(params[:id])
    if @whiskey.destroy
      redirect('/whiskeys')
    else
      redirect("/whiskeys/#{@whiskey.id}")
    end
  end

end
