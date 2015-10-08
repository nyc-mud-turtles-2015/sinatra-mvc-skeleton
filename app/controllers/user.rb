get '/users' do
  @users = User.all
  erb :'/users/index'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = (params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect '/users'
  else
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

get '/users/:id/comments' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

get 'users/:id/posts' do
  @user = User.find(params[:id])
  erb :'/users/show'
end
