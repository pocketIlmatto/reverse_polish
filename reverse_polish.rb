class ReversePolish
	
	def self.calculate (input)
		#validate input - only numbers and operators for now
		raise ArgumentError, "Argument contains invalid characters (only numbers, parenthesis and operators are allowed)" if /[^\d\+\-\/\*\s]/ =~ input
		
		two_arguments = lambda do |x, y, operator|
							case operator
								when "+"
									x + y
								when "-"
									x - y
								when "/"
									raise ArgumentError, "Division by 0" if y == 0
									x / y
								when "*"
									x * y
							end
						end
		#build stack
		stack = []
		input_array = input.split(" ")
		input_array.each do |token|
			if /^[\-]?\d+$/ =~ token
				stack.push(token.to_i)
				#puts "Pushing #{token} to stack"
			#select for operators that take 2 operators
			elsif /^[\+\-\/\*]$/ =~ token
				#validate there are at least two elements
				raise ArgumentError, "Input does not contain enough values for the '#{token}' operator" unless stack.size >= 2
				#pop n arguments from stack
				n1 = stack.pop()
				n2 = stack.pop()
				#send n arguments and operator to evaluator
				#push result, if any, onto the stack
				stack.push(two_arguments.call(n1, n2, token))
			else
				raise ArgumentError, "Argument contains invalid characters: #{token}"
			end
		end #finsished going through the input

		#puts "#{stack.inspect}"
		raise ArgumentError, 'Input contains too many values' if stack.size != 1

		stack.pop()
	end
end