require 'test/unit'
require 'lib/to_insane'

class ToInsaneTest < Test::Unit::TestCase

  def test_integer_to_insane
    100.times do |integer|
      2.upto(36) do |base|
        assert_equal integer.to_s(base), integer.to_insane(base)
      end
    end
    871092374.step(871292374,314) do |integer|
      2.upto(36) do |base|
        assert_equal integer.to_s(base), integer.to_insane(base)
      end
    end

  end  

  def test_string_from_insane
    100.times do |integer|
      2.upto(36) do |base|
        assert_equal integer.to_s(base).to_i(base), integer.to_s(base).from_insane(base)
      end
    end
    871092374.step(871292374,314) do |integer|
      2.upto(36) do |base|
        assert_equal integer.to_s(base).to_i(base), integer.to_s(base).from_insane(base)
      end
    end

  end
  
  def test_inverse_relationship
    871092374.step(871292374,314) do |integer|
      36.upto(67) do |base|
        assert_equal integer.to_insane(base),  integer.to_insane(base).from_insane(base)
      end
    end

  end

  def test_invalid_charset
    e = assert_raise(ArgumentError) { 5.to_insane(5,'aaabe14123') }
    assert_equal "Character set has duplicate characters", e.message
  end
  
  def test_invalid_base58_string
    e = assert_raise(ArgumentError) { 'kjasd?'.from_insane }
  end
  
end
