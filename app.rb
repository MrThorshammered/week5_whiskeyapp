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
    @whiskeys = Whiskey.new(params[:whiskey])
    if @whiskeys.save
      redirect("/whiskeys/#{@whiskey.id}")
    else
      erb(:"whiskeys/new")
    end
  end

  # show
  get '/whiskeys/:id' do
    @whiskeys = Whiskey.find(params[:id])
    erb(:"whiskeys/show")
  end

  # edit
  get '/whiskeys/:id/edit' do
    @whiskeys = Whiskey.find(params[:id])
    erb(:"whiskeys/edit")
  end

  # update
  post '/whiskeys/:id' do
    @whiskeys = Whiskey.find(params[:id])
    if @whiskeys.update_attributes(params[:whiskey])
      redirect("/whiskeys/#{@whiskeys.id}")
    else
      erb(:"whiskeys/edit")
    end
  end

  # delete
  post '/whiskeys/:id/delete' do
    @whiskeys = Whiskey.find(params[:id])
    if @whiskeys.destroy
      redirect('/whiskeys')
    else
      redirect("/whiskeys/#{@whiskey.id}")
    end
  end

end
