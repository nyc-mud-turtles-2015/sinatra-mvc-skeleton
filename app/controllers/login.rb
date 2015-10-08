post '/login' do
  @user = User.find_by(username: params[:username])
  if @user.login(@user, params[:password])
    session[:username] = params[:username]
    redirect ('/')
  else
    redirect ('/login')
  end
end

post '/register' do
  if User.register(params)
    session[:username] = params[:username]
    redirect ('/')
  else
    redirect ('/login')
  end
end

get '/login' do
    session[:username] = nil
    erb :login
end

get '/register' do
    session[:username] = nil
    erb :login
end

get '/logout' do
    session[:username] = nil
    erb :login
end
