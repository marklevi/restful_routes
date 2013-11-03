require 'sinatra'

get '/notes' do
  @all_notes = Note.all
  erb :index
end

get '/notes/new' do 
  erb :note_new
end

post '/notes' do
  @note = Note.create(params)
  redirect "/notes/#{@note.id}"
end

get '/notes/:id' do 
  @curr_note = Note.find_by_id(params[:id])
  erb :note_id 
end

get '/notes/:id/edit' do 
  @id = params[:id]
  erb :note_edit
end

put '/notes/:id' do 
  curr_note = Note.find_by_id(params[:id])
  curr_note.content = params[:content]
  curr_note.save
  redirect '/notes'
end

delete '/notes/:id' do 

  curr_note = Note.find_by_id(params[:id])
  curr_note.destroy
  redirect '/notes'
end

