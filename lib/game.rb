class Game
	attr_accessor :human_player, :enemies

	# On prepare les joueurs (humains ou ennemis)
	def initialize(name_human_player)
		@human_player = HumanPlayer.new(name_human_player)
		@enemies = [Player.new("Joey"), Player.new("Jill"), Player.new("Jack"), Player.new("Jane")] 
	end

	def kill_player(player_to_kill)
	# delete permet d'éliminer l'élément de l'array, le paramètre va être spécifié ci-dessous dans le menu_choice
		@enemies.delete(player_to_kill)
	end

	def is_still_ongoing?
	# Si le joueur a toujours des points de vie et des ennemis sont toujours en vie, on retourne true (le jeu est toujours en cours)
		if @human_player.life_points > 0 && @enemies.size > 0
			return true
		else
			return false
		end
	end

	# Methode pour indiquer l'état du joueur et le nombre d'ennemis en vie
	def show_players
		puts @human_player.show_state
		puts "Il y a #{@enemies.size} ennemis en vie"
	end 

	# Methode pour afficher le menu et proposer des choix a l'utilisateur
	def menu
		puts "\nQuelle action voulez-vous effectuer ?"
		puts "----------------------------------\n"
		puts "a - Chercher une meilleure arme"
		puts "s - Chercher à se soigner" 
		puts "----------------------------------\n"
		puts "Attaquer un joueur en vue :"

	# A chaque tour, on affiche bien l'état des ennemis, l'index va correspondre au choix.
	# C'est possible grâce a une boucle qui parcourt le tableau et nous permet de 
	# récupérer la valeur index de chaque élément
	
	@enemies.each_with_index do |enemy, index|
		puts "#{index} - #{enemy.show_state}" 
	end
	puts "----------------------------------\n"
	# On récupère le choix du joueur
	print "> "
	user_choice = gets.chomp.to_s
	puts "----------------------------------\n"
	menu_choice(user_choice)
end

	def menu_choice(choice)
		if choice == "a"
			human_player.search_weapon
		elsif choice == "s"
			human_player.search_health_pack
		end
		# On fait le tour de l'array et on cible les éléments par leur index
		@enemies.each_index do |index|
		# On transforme l'index en string en on le stocke dans une variable index_string
		# (le choix doit être en string pour la comparaison a cause du gets.chomp)
			index_string = index.to_s
		# Si le choix effectué par le joueur correspond à l'index de l'ennemi, le joueur attaque l'ennemi en question
			if choice == index_string
				human_player.attacks(enemies[index])
		# Si l'ennemi ciblé a des points de vie inférieurs ou égaux à zéro,
		# on fait appel à la méthode kill_player pour qu'elle l'élimine de l'array
				if enemies[index].life_points <= 0
					kill_player(enemies[index])
				end
			end
		end	
	end

  # Méthode pour que chaque ennemi de l'array lance une attaque
	def enemies_attack
			enemies.each do |enemy|
				enemy.attacks(human_player)
			end
	end	

	def end
			puts "La partie est finie"
		# Si le joueur est mort, on lui dit qu'il a perdu.
		# Si il est vivant, on lui dit Bravo.
			if human_player.life_points < 0
				puts "LOSER !!! Vous avez perdu!"
			else
				puts "BRAVO !!! Vous avez gagné !!!"
			end
	end	
end