get '/' do
  erb :hello
end

get '/tom' do
  'a modern day warrior mean, mean stride.'
end

# Using positional parameters in the path
get '/greet/:name' do
  "Hello #{params[:name]}"
end

# http://localhost:9393/othergreet?name=miss_Kitty
# the part after the ? is known as the "Query String"
# it represents a key value pair (like a Ruby Hash)
# you can join multiple values by using an &

get '/othergreet' do
  "Hello #{params[:name]} from #{params[:town]}"
end

# Or process parameters by HTML forms
#
get '/form' do
  erb :form
end

post '/form_result' do
  "Hello #{params[:name]} from #{params[:town]}"
end

get '/favorite_animal' do
  erb :'favorite_animal/form'
end

post "/favorite_animal" do
  session[:favorite_name] = params[:favorite_name]
  redirect "/"
end


get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    redirect "/"  # go to your happy place
  else
    "drop dead"
  end
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:user][:username])
  if user.password == params[:user][:password]
    session[:user_id] = user.id
    "awesome sauce"
  else
    "go away bad hacker Vladimir Putin"
  end
end
