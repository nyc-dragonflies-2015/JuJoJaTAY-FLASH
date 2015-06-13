require 'pry'

get '/login' do
  erb :'/auth/_login'
end

post '/login' do
  if @user = User.find_by(email:params[:user][:email])
    if @user.password == params[:user][:password]
      session[:id] = @user.id
      redirect '/decks'
    end
  else
    @errors = "You fucked up"
    erb :'/auth/_login'
  end
end

get '/signup' do
  erb :'/auth/_signup'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/decks'
  else
    #you fucked up
    # @errors = []

    erb :signup
  end
end

get '/logout' do
  session[:id] = nil
  redirect '/login'
end