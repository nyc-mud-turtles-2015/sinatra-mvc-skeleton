get '/' do
  @posts = Post.all
  erb :'/posts/index'
end

get '/post/new' do
  erb :'/posts/new'
end

post '/post/new' do
  @user = User.find_by(username: session[:username])
  @post = Post.new(params[:post])
  @user.posts << @post
  if @user.save
    redirect ('/')
  else
    @post.errors.messages
  end
end

post '/post/:id/comment' do
  @post = Post.find(params[:id])
  @comment = Comment.new(params[:comment])
  @user = User.find_by(username: session[:username])
  @user.comments << @comment
  if @user.save
    redirect ("/post/#{@post.id}")
  else
    @post.errors.messages
  end
end

get '/post/click/:id' do
  @post = Post.find(params[:id])
  @user_id = User.find_by(username: session[:username]).id
  @vote = Vote.find_by(user_id: @user_id)
  if @vote.nil? && request.xhr?
    @vote = Vote.new(user_id: @user_id, voteable_id: @post.id, voteable_type: :post)
    @post.votes << @vote
    status 202
  else
    @vote.destroy
    status 498
    return false
  end
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :'/posts/show'
end
