get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

get '/posts/new' do
  erb :'posts/new'
end

get '/posts/:id' do
    @comments = Comment.all
    @post = Post.find(params[:id])
    id = Post.find_by(params[:user_id])
    @user = User.find(params[:id])
  erb :'posts/show'
end

post '/posts' do
  user = User.find_by(params[:id])
  if @post.save
    redirect "/posts/#{@post.id}"
  else
    erb :'posts/new'
  end
end

post 'posts/:id/comments' do

  end


get "/posts/:id/edit" do
  @post = Post.find(params[:id])
  erb :'posts/edit'
end

put '/posts/:id' do
  @post= Post.find(params[:id])
  @post.update_attributes(params[:post])
  erb :'posts/show'
end
delete '/posts/:id' do
  post = Post.find(id)
  post.destroy
  redirect('/')
end


































# get "/posts/:id/edit" do
#   @post = Post.find(params[:id])
#   erb :'posts/edit'
# end

# put '/posts/:id' do
#   @post = Post.find(params[:id])
#   @post.update_attributes(params[:post])
#   erb :'posts/show'
# end
# delete '/posts/:id' do
#   post = Post.find(params[:id])
#     post.destroy
#     redirect '/posts'
#   end
# post '/posts' do
#   user = User.find_by(id: session[:user_id])
#   post = user.posts.new(params[:post])
#   comment = user.comments.new(params[:comment])
#   if post.save && comment.save
#     redirect '/posts'
#   else
#     flash[:error] = 'Failed to create post'
#     redirect '/posts'
#   end
# end
