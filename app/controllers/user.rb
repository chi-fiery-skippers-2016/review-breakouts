get '/login' do
  erb :"session/new"
end

post '/login' do

  @user = User.find_by(username: params[:username])

  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @message = "Your credentials were incorrect. Please try again."
    erb :"session/new"
  end
end

get '/logout' do
  session.delete(:user_id)
end

