get '/login' do
  erb :'/auth/login'
end

post '/login' do
  @user = User.find_by_email(params[:user][:email])
  if @user.password == params[:user][:password]
    session[:id] = @user.id
    redirect '/decks'
  else
    "die"
  end
  erb :'/auth/login'
end

get '/signup' do
  #sign up form, post to users
end

post '/users' do
  #create a new user and redirect to user page
end
