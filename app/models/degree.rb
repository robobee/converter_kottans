class Degree
  class UnspecifiedInputType < StandardError; end
  class UnspecifiedOutputType < StandardError; end

  CONVERSIONS = { 
    celsius: { 
      celsius: lambda { |x| x },
      kelvin: lambda { |x| x - 273.15 },
      farenheit: lambda { |x| x * 9.0/5 + 32 }
    },
    kelvin: {
      celsius: lambda { |x| x + 273.15 },
      kelvin: lambda { |x| x },
      farenheit: lambda { |x| x * 9.0/5 - 459.67 }
    },
    farenheit: {
      celsius: lambda { |x| (x - 32) * 5.0/9 },
      kelvin: lambda { |x| (x + 459.67) * 5.0/9 },
      farenheit: lambda { |x| x }
    }
  }

  attr_reader :value, :type

  def initialize value, type
    raise UnspecifiedInputType unless CONVERSIONS.include?(type)
    @value = value.to_f
    @type = type
  end

  def convert_to output_type
    raise UnspecifiedOutputType unless CONVERSIONS.include?(output_type)
    CONVERSIONS[type][output_type].call(value)
  end

end
