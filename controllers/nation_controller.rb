#INDEX
get '/nations/?' do
  @nations = Nation.all()
  erb :'nations/nations_index'
end

#NEW
get '/nations/new/?' do
  erb :'nations/nations_new'
end

#CREATE
post '/nations/?' do
  @nation = Nation.new( params )
  @nation.save()
  redirect to '/nations'
end

#SHOW
get '/nations/:id/?' do
  @nation = Nation.find( params[:id] )
  erb :'nations/nations_show'
end

#EDIT
get '/nations/:id/edit/?' do
  @nation = Nation.find( params[:id] )
  erb :'nations/nations_edit'
end

#UPDATE
put '/nations/:id/?' do
 @nation = Nation.update( params )
 redirect to '/nations/#{params[:id]}'
end

#DELETE
delete '/nations/:id/?' do
  Nation.destroy( params[:id] )
  redirect to '/nations'
end