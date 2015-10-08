get '/' do
  @posts = Post.all
  erb :'/posts/index'
end

get '/post/new' do
  erb :'/posts/new'
end

post '/post/new' do
  @post = Post.new(params[:post])
  if @post.save
    redirect ('/')
  else
    @post.errors.messages
  end
end

post '/post/:id/comment' do
  @post = Post.find(params[:id])
  @comment = Comment.new(params[:comment])
  @user = User.find(@post.user_id)
  @user.comments << @comment
  if @user.save
    redirect ("/post/#{@post.id}")
  else
    @post.errors.messages
  end
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :'/posts/show'
end
