#controller

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/login' do
  erb :account_created
end