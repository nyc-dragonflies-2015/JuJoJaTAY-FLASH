get '/decks' do
  if session[:id]
    @decks = Deck.all
    erb :'/decks/index'
  else
    "ERROR"
  end
end

get '/decks/:id' do
  if session[:id]
    @deck = Deck.find_by(id: params[:id])
    session[:guesses] = 0
    @round = Round.create(user_id: session[:id], deck_id: @deck.id)
    erb :'/decks/show'
  else
    "ERROR"
  end
end

post '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  @guess = Guess.create(round_id: 1)
  if params[:answer] == @deck.cards[session[:guesses]].answer

    redirect '/decks/:id'
  else
    redirect '/decks'
  end
  session[:guesses] += 1
  erb :'/decks/show'
end