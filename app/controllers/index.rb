get '/' do
  redirect '/cats'
end

get '/cats' do
  @cats = Cat.all
  erb :"cats/index"
end

get '/cats/new' do
  redirect '/login' if session[:user_id] == nil

  @cat = Cat.new

  if request.xhr?
    erb :"cats/new", layout: false
  else
    erb :"cats/new"
  end
end

get '/cats/:id' do
  find_cat
  erb :"cats/show"
end

post '/cats' do
  @cat = Cat.new(params[:cat])

  if request.xhr?
    if @cat.save
      @cat.to_json
    else
      status 422
      @cat.errors.full_messages.to_json
    end
  else
    if @cat.save
      redirect '/cats'
    else
      erb :"cats/new"
    end
  end
end

get '/cats/:id/edit' do
  find_cat
  checked_logged_in
  redirect '/cats' if @cat.user_id != current_user.id
  erb :"cats/edit"
end

put '/cats/:id' do
  find_cat
  checked_logged_in
  redirect '/cats' if @cat.user_id != current_user.id
  if @cat.update_attributes(params[:cat])
    redirect '/cats'
  else
    erb :"cats/edit"
  end
end

delete '/cats/:id' do
  find_cat
  @cat.destroy
  redirect '/cats'
end



