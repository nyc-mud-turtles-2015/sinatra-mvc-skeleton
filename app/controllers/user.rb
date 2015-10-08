
get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.create(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/users/user.id'
  else
    redirect '/'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'/users/show'
end

get 'users/:id/posts' do
  @user = User.find_by(id: params[:id])
  erb :'/users/show'
end
