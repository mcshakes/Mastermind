class Codemaker
  attr_reader :colors, :code

  def initialize
    @colors = ["r", "g", "b", "y"]
    @code = (0..3).map { colors.sample }
  end
end

colors = Codemaker.new
colors.code
