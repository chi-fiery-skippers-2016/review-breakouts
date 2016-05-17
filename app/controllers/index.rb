get '/' do
  redirect '/cats'
end

get '/cats' do
  @cats = Cat.all
  erb :"cats/index"
end

get '/cats/new' do
  @cat = Cat.new
  erb :"cats/new"
end

get '/cats/:id' do
  find_cat
  erb :"cats/show"
end

post '/cats' do
  @cat = Cat.new(params[:cat])

  if @cat.save
    redirect '/cats'
  else
    erb :"cats/new"
  end
end

get '/cats/:id/edit' do
  find_cat
  erb :"cats/edit"
end

put '/cats/:id' do
  find_cat
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



