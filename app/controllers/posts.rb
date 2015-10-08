get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

# get '/entries/new' do
#   erb :'entries/new'
# end

get '/posts/:id' do
    @comments = Comment.all
    @post = Post.find(params[:id])
  erb :'posts/show'
end

