get '/login' do
  @user = User.new
  erb :'/auth/login'
end

post '/login' do
 @user = User.find_by(username: params[:username])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'users/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
