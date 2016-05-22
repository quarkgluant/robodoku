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
class Solver
	def initialize(puzzle)
		@puzzle = puzzle
	end

	def transformation_en_matrice(puzzle)
		@tab = Array.new(9) { Array.new(9) { 0 } }
		@puzzle.each do |car|
			if car == '\n' or car == '\r\n'
				i += 1 
			elsif car == " "
				@tab[i][j] = 0
			else
				@tab[i][j] = car.to_i
			end
			j += 1
		end
	end
	
	def charge(item)
		@compt = 0
  	item.each{|car| @compt += 1  if car != 0}
  	@compt
	end

		

	def test_unicite(item)
		# item.inject(Hash.new(0)) do |accu, cell|
		# 	accu[cell] += 1
		# 	return false if accu[cell] > 1
		# end
		@res = Hash.new(0)
		item.each do |nombre|
			@res["#{nombre}"] += 1
			return false if @res["#{nombre}"] > 1
		end

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
	end
	def solver

	end



end