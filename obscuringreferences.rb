class ObscuringReferences
  attr_reader :data
  def initalize(data)
    @data = data
  end

  # issue The diameters method knows not only how to calculate diameters, but also where to find rims and tires in the array.
  # The references are leaky. They escape encapsu- lation and insinuate themselves throughout the code.

  def diameters
    # 0 is rim, 1 is tire
    data.collect {|cell| cell[0] + (cell[1] * 2)}
  end

  # example data
  # @data = [[622, 20], [622, 23], [559, 30], [559, 40]]
end
