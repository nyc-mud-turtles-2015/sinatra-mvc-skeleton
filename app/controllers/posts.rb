get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

get '/posts/new' do

end

get '/posts/:id' do
    @comments = Comment.all
    @post = Post.find(params[:id])
  erb :'posts/show'
end

post '/posts' do
  user = User.find_by(params[:id])
  if @entry.save
    redirect "/entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/new'
  end
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
