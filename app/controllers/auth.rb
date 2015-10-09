

get '/login' do
  @user = User.new
  erb :'/auth/login'
end

post '/login' do
  if user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/users/user.id'
    else
      erb :'users/login'
    end
  else
    @errors=["Incorrect name/or password."]
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/login'
end
