class Player
    attr_accessor :name, :life_points
    
  
    def initialize(name) #la méthode initialise les variables d'instances nom et nombre de points de vie
      @name = name
      @life_points = 10
    end
  
    def show_state #la méthode montre l'état du joueur
      return "#{@name} a #{@life_points} points de vie"
    end
  
    def gets_damage(damaged_received) # la méthode défini le nombre de degat(s) reçus
      @life_points -= damaged_received
  
          if @life_points <= 0
            puts "le joueur #{@name} a été tué !"
          end
    end
  
    def attacks(player) #la méthode d'attaque du joueur 1 sur le joueur 2
      puts "le joueur #{@name} attaque le joueur #{player.name}"
      damage = compute_damage
      puts "il lui inflige #{damage} points de dommages"
      player.gets_damage(damage)
    end
  
    def compute_damage # méthode pour définir le nombre de dommages effectués à chaque lancé
      return rand(1..6)
    end
  
  end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        super(name)
        @weapon_level = 1
        @life_points = 100	
    end

    def show_state
        return "#{@name} a #{@life_points} points de vie et possède une arme de niveau #{@weapon_level}" 
    end

    def compute_damage
		rand(1..6) * @weapon_level
    end
    
    def search_weapon
		weapon_found = rand(1..6)
		puts "Bravo, vous avez trouvé une arme de niveau #{weapon_found}"

		if weapon_found > @weapon_level
			@weapon_level = weapon_found
			puts "Yeah, cette nouvelle arme est meilleure, je la garde"
		else
			puts "Mince, cette arme est pourrie, je ne la garde pas"
		end 
    end
    
    def search_health_pack
        
    end