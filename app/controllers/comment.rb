

post '/comments' do
  comment = Comment.create(params[:comment])
  redirect 'comments/#{comment.id}'
end

get '/comments/:id' do
  @comment = Comment.find(params[:id])
  erb :'comment/show'
end


get "/comments/:id/edit" do
  @comment = Comment.find(params[:id])
  erb :'comments/edit'
end

put '/comment/:id' do
  comment = Comment.find(params[:id])
  comment.update(params[:comment])
  redirect ("/comment/#{comment.id}")
end
