#controller

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/create_account' do
  # params = { :first_name => "Keith" }
  user = User.new
  user.first_name = params[:first_name]
  user.last_name = params[:last_name] 
  user.email = params[:email] 
  user.password = params[:password] 
  user.save


  erb :account_created
end


post '/login' do
  email = params[:email] #user input value
  password = params[:password]

  if user = User.authenticate(email, password)
    session[:user_id] = user.id #is a hash and lives with the user. Session holds the data for that user, hold the row
    redirect '/secret'
  else
    redirect '/'
  end
end

get '/secret' do
  logged_in = session[:user_id]
  if logged_in # ONLY DO THIS IF LOGGED IN
    erb :secret
  else
    redirect '/'
  end
end

post '/logout' do
  session.clear  #.clear is a sinatra method (rack)
  redirect '/'
end


