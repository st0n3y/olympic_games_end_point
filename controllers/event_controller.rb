require 'pry-byebug'

#INDEX
get '/events/?' do
  @events = Event.all()
  erb :'events/events_index'
end

#NEW
get '/events/new/?' do
  @events = Event.all()
  erb :'events/events_new'
end

#CREATE
post '/events/?' do
  @event = Event.new( params )
  @event.save()
  redirect to '/events'
end

#SHOW
get '/events/:id/?' do
  @event = Event.find( params[:id] )
  erb :'events/events_show'
end

#EDIT
get '/events/:id/edit/?' do
  @event = Event.find( params[:id] )
  erb :'events/events_edit'
end

#UPDATE
put '/events/:id/?' do
 @event = Event.update( params )
 redirect to "/events/#{params[:id]}"
end

#DELETE
delete '/events/:id/?' do
  Event.destroy( params[:id] )
  redirect to '/events'
end