harry_deck = Deck.create(name: "Harry Potter Trivia", description: "Test your Harry Potter knowledge you dork")

File.open('db/fixtures/harry.txt').each_slice(2) {|question, answer| Card.create(question: question.chomp, answer: answer.chomp).update_attributes(deck_id: harry_deck.id)}

