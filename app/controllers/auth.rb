get '/login' do
  erb :'/auth/login'
end

post '/login' do
  user = User.find_by(params[:username])
  if user.password_hash == user[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
