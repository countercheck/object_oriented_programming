


# def execute_orders(position,orders, bounds)
# 	orders.each do |this_order|
# 		if this_order == "M"
# 			position = move(position, bounds)
# 		elsif this_order == "L"|| "R"
# 			position[2] = turn(this_order,position[2])
# 		end
# 		print position
# 		print "\n"
# 		display_map(bounds, position)
# 	end
# end

# def display_map(bounds, position)
# 	(bounds[1].downto(0)).each do |y|
# 		(0..bounds[0]).each do |x|
# 			if position[0] == x && position[1] == y
# 				print position[2]
# 			else print "*"
# 			end
# 		end
# 		print "\n"
# 	end

# end

class MarsRover
	def initialize(position,orders, bounds)
		@position = position
		@orders = orders.split("")
		@bounds = bounds
	end
	
	def execute_orders
		puts "Rover rolling out!"
		@orders.each do |this_order|
			if this_order == "M"
				@position = move
			elsif this_order == "L"|| "R"
				@position[2] = turn(this_order)
			end
			display_map
		end
		puts "Rover halted at #{@position} \n \n"
	end

	def turn(order)
		case @position[2]
		when "N" then num_heading = 0
		when "E" then num_heading = 1
		when "S" then num_heading = 2
		when "W" then num_heading = 3
		else puts "Heading error.  Old heading retained"
			return
		end

		if order == "R"
			num_heading += 1
		elsif order == "L"
			num_heading -= 1
		else puts "Order error"
			return
		end

		case num_heading
		when 0 , 4 then new_heading = "N"
		when 1 then new_heading = "E"
		when 2 then new_heading = "S"
		when 3 , -1 then new_heading = "W"
		else puts "Heading error.  Old heading retained"
			return
		end
		@position[2]=new_heading
	end

	def move
		new_position = @position
		
		case new_position[2]
		when "N" then new_position[1] += 1
		when "E" then new_position[0] += 1
		when "S" then new_position[1] -= 1
		when "W" then new_position[0] -= 1
		end

		if new_position[0] > @bounds[0] || new_position[1] > @bounds[1] || new_position[0] < 0 || new_position[1] < 0
			puts "Danger!  Rover headed out of bounds.  Move aborted.  Continuing with next instruction."
			return
		else
			@position = new_position
		end
	end

	def display_map
		(@bounds[1].downto(0)).each do |y|
			(0..@bounds[0]).each do |x|
				if @position[0] == x && @position[1] == y
					print @position[2]
				else print "*"
				end
			end
			print "\n"
		end
		print "\n"
	end
end
plateau = [5,5]
rover1 = MarsRover.new([1, 2, "N"], "LMLMLMLMM", plateau)
rover2 = MarsRover.new([3, 3, "E"], "MMRMMRMRRM", plateau)
rover1.execute_orders
rover2.execute_orders


#test1
# directions = ["N","E","S","W"]
# orders = ["R", "L"]
# xy = [0,0]
# directions.each do |cardinel|
# 	orders.each do |l_s|
# 	|	heading = turn(l_s, cardinel)
# 		puts heading
# 		move(xy,heading)
# 		puts xy
# 	end
# end