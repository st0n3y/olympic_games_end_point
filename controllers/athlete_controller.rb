#INDEX
get '/athletes/?' do
  @athletes = Athlete.all()
  erb :'athletes/index'
end

#NEW
get '/athletes/new/?' do
  @athletes = Athlete.all()
  erb :'athletes/new'
end

#CREATE
post '/athletes/?' do
  @athlete = Athlete.new( params )
  @athlete.save()
  redirect to '/athletes'
end

#SHOW
get '/athletes/:id/?' do
  @album = Album.find( params[:id] )
  erb :'albums/show'
end

#EDIT
get '/athletes/:id/edit/?' do
  @athlete = Athlete.find( params[:id] )
  erb :'athletes/edit'
end

#UPDATE
put '/athlete/:id/?' do
 @athlete = Athlete.update( params )
 redirect to '/athletes/#{params[:id]}'
end

#DELETE
delete '/athletes/:id/?' do
  Athlete.destroy( params[:id] )
  redirect to '/athletes'
end