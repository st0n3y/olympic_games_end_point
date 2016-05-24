#INDEX
get '/athletes/?' do
  @athletes = Athlete.all()
  erb :'athletes/athletes_index'
end

#NEW
get '/athletes/new/?' do
  @nations = Nation.all()
  erb :'athletes/athletes_new'
end

#CREATE
post '/athletes/?' do
  @athlete = Athlete.new( params )
  @athlete.save()
  redirect to '/athletes'
end

#SHOW
get '/athletes/:id/?' do
  @athlete = Athlete.find( params[:id] )
  erb :'athletes/athletes_show'
end

#EDIT
get '/athletes/:id/edit/?' do
  @nations = Nation.all()
  @athlete = Athlete.find( params[:id] )
  erb :'athletes/athletes_edit'
end

#UPDATE
put '/athlete/:id' do
 @athlete = Athlete.update( params )
 redirect to '/athletes/#{params[:id]}'
end

#DELETE
delete '/athletes/:id/?' do
  Athlete.destroy( params[:id] )
  redirect to '/athletes'
end