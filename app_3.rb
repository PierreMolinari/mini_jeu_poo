require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

def intro
	# On affiche l'introduction du jeu
puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

# On demande l'utilisateur son prénom
puts "Quel est ton prénom ?"
print ">"
end	

# Grâce a la methode perform, on fait appel aux différentes méthodes crees
# en amont dans player.rb et game.rb (require ci-dessus)
def perform
	intro
	# On récupère le nom entré par l'utilisateur
	my_game = Game.new(gets.chomp)

	# La boucle while permet déxecuter autant de tours que besoin jusqu'a ce que
	# le joueur soit mort ou qu'il n'y ait plus d'ennemis
	while my_game.is_still_ongoing? == true
	my_game.show_players
	my_game.menu
	my_game.enemies_attack
	end

	my_game.end
end

perform