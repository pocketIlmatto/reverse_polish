require 'minitest/autorun'
require_relative 'reverse_polish'


class ReversePolishTest < MiniTest::Unit::TestCase

	def test_invalid_characters
		assert_raises ArgumentError do ReversePolish::calculate("1 1 + ,") end
	end

	def test_too_many_arguments
		assert_raises ArgumentError do ReversePolish::calculate("1 0 3 +") end
	end

	def test_not_enough_arguments
		assert_raises ArgumentError do ReversePolish::calculate("1 +") end
	end

	def test_divide_by_zero
		assert_raises ArgumentError do ReversePolish::calculate("0 1 /") end
	end

	def test_add 
		assert 2, ReversePolish::calculate("1 1 +")
	end

	def test_subtract
		assert 2, ReversePolish::calculate("3 1 -")
	end

	def test_divide
		assert 2, ReversePolish::calculate("4 2 /")
	end

	def test_multiply
		assert 2, ReversePolish::calculate("1 2 *")
	end

	def test_add_negative_numbers
		assert 3, ReversePolish::calculate("-1 4 +")
	end

	def test_subtract_negative_numbers
		assert -5, ReversePolish::calculate("-1 4 -")
	end

	def test_multiply_negative_numbers
		assert -4, ReversePolish::calculate("-1 4 *")
	end

	def test_divide_negative_numbers
		assert -1, ReversePolish::calculate("-4 4 /")
	end

	def test_multiple_operations
		assert 14, ReversePolish::calculate("5 1 2 + 4 * + 3 -")
	end

end