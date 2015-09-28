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
