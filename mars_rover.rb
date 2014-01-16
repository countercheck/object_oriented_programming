def turn(order, old_heading)
	case old_heading
	when "N" then num_heading = 0
	when "E" then num_heading = 1
	when "S" then num_heading = 2
	when "W" then num_heading = 3
	else p "Heading error"
		return
	end

	if order == "R"
		num_heading += 1
	elsif order == "L"
		num_heading -= 1
	else puts "Order error"
	end

	case num_heading
	when 0 , 4 then new_heading = "N"
	when 1 then new_heading = "E"
	when 2 then new_heading = "S"
	when 3 , -1 then new_heading = "W"
	else p "Heading error"
		return
	end
end

def move(xy,heading)
	case heading
	when "N" then xy[0] += 1
	when "E" then xy[1] += 1
	when "S" then xy[0] -= 1
	when "W" then xy[1] -= 1
	else puts "Heading error"
	end
end


#test
directions = ["N","E","S","W"]
orders = ["R", "L"]
xy = [0,0]
directions.each do |cardinel|
	orders.each do |l_s|
		heading = turn(l_s, cardinel)
		puts heading
		move(xy,heading)
		puts xy
	end
end