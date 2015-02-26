class Degree
  class UnspecifiedType < StandardError; end

  attr_reader :value, :type

  ALLOWED_TYPES = [:celsium, :farengheit]

  def initialize value, type
    raise UnspecifiedType unless type.is_a?(Symbol) and ALLOWED_TYPES.include?(type)
    @value = value.to_f
    @type = type
  end

  def to_farengheit
    case type
      when :celsium then (value * 9.0/5 + 32)
      when :farengheit then (value)
    end
  end

  def to_celsium
    case type
      when :celsium then (value)
      when :farengheit then ((value - 32) * 5.0/9)
    end
  end
end
