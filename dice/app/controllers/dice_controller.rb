class DiceController < ApplicationController

	def welcome
		render 'welcome'
	end

	def roll
		goal = params["goal"]

		#@prev_rolls = prev != nil ? prev.chomp.split(',').map { |x| x.to_i }
		@goal = goal != nil ? goal.chomp.to_i : nil
		@die_1 = new_roll
		@die_2 = new_roll
		@sum = @die_1 + @die_2
		@win = false
		@lose = false
		
		if @goal == nil
			@goal = @sum
			if @sum == 7 || @sum == 11
				@win = true
			elsif @sum == 2 || @sum == 3 || @sum == 12
				@lose = true
			end
		else 
			if @sum == @goal
				@win = true
			elsif @sum == 7
				@lose = true
			end
		end

		render 'roll'
	end

	def new_roll
		return rand 1..6
	end

end
