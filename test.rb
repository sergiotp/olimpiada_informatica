require_relative 'counter'
require 'minitest/autorun'

class TestValidator < Minitest::Test
  def setup
    @validator = Validator.new
  end

  def test_total_records_count_when_is_0
    assert_equal false, @validator.validate_records(0)
  end

  def test_total_records_when_is_greather_than_0
    assert_equal true, @validator.validate_records(100)
  end

  def test_total_records_count_when_is_greather_than_100_000
    assert_equal false, @validator.validate_records(100_001)
  end

  def test_total_registers_count_when_is_less_the_0
    assert_equal false, @validator.validate_register(-1)
  end

  def test_total_registers_when_is_greather_than_0
    assert_equal true, @validator.validate_register(2)
  end

  def test_total_registers_count_when_is_greather_than_1_000_000
    assert_equal false, @validator.validate_register(1_000_001)
  end

end
