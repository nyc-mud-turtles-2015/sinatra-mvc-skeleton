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
  @comment = Comment.new(params[:comment])
  @post = Post.find(params[:id])
  @post.comments << @comment
  if @post.save
    redirect ('/post/:id')
  else
    @post.errors.messages
  end
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :'/posts/show'
end
