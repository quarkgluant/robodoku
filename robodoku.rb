require_relative 'solver'

filename = ARGV[0]
puzzle = File.read(filename)

# board = Array.new(9) { Array.new(9) }
# def boucle_jeu(board)
#   pour chaque item
#     calcul_charge
#     test_item_plus_rempli
  

# end

# def test_unicite(item)
#   item.inject(Hash.new(0)) do
#     |mem, val| mem[val] += 1
#     return false if mem.values.any?{|v| v > 1 }
#   end
# end
# def test_ligne(row)
  
# end

# def test_col(col)

# end

# def test_square(carre)

# end
puzzle =  "8  5 4  7\n  5 3 9  \n 9 7 1 6\n1 3   2 8\n 4     5\n2 78136 4\n 3 9 2 8\n  2 7 5  \n6  3 5  1"
def transformation_en_matrice(puzzle)
	tab = Array.new(9) { Array.new(9) { 0 } }
	i, j = 0,0
	puzzle.each_char do |car|
		if not car.nil?
			if car =~ /[1-9]/ 
					tab[i][j] = car.to_i
					j += 1
			elsif car == " "
					tab[i][j] = 0
					j += 1
			else
				i += 1
				j = 0 
			end
		end
	end
	tab
end

def charge(item)
	item.inject(0) do |compteur, nb|
		nb != 0 && nb != nil ? compteur += 1 : compteur
	end
end


def test_unicite(item)
	@res = Hash.new(0)
	item.each do |nombre|
		if nombre != nil
			@res["#{nombre}"] += 1
			return false if @res["#{nombre}"] > 1 && nombre != 0
		end
	end
	true
end

def ligne(abs, ord)
	@tab[abs]
end

def colonne(abs, ord)
	@tab.map{|cell| cell[ord]}
end

def carre(abs, ord)
	abs_carr = abs / 3
	ordo_carr = ord / 3
	@carre = Array.new(3) { Array.new(3) { 0 } }
	# @tab.each do |x|
	# 	x.each do |y|
	# 		@carre << y
	# 	end
	# end
	# @carre
	# @carre << @tab[abs_carr..(abs_carr + 2)][ordo_carr..(ordo_carr..ordo_carr+2)]
	# @tab.map do |x| 
	# 	if abs_carr
	# 		x.map do |y| 
	# 		y 
	# 	end
	# end
	indx = 0
	@tab.each_with_index do |e, i|
		if ( i >= abs_carr or i <= abs_carr + 2 )
			e.each_with_index do |el, j|
				@carre[indx] << el if ( j >= ordo_carr or j <= ordo_carr + 2  )
			end
			indx += 1
		end
	end
	@carre
end


def solver
	sudoku = transformation_en_matrice(puzzle)

end

