get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
end

get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  session[:guesses] = 0
  erb :'/decks/show'

end

post '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  if params[:answer] == @deck.cards[session[:guesses]].answer
    "hayyy"
  else
    redirect '/decks'
  end
  session[:guesses] += 1
  erb :'/decks/show'
end