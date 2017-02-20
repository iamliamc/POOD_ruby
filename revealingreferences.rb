class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  # Separating iteration from the action that’s being performed on each element is a common case of multiple responsibility that is easy to recognize.

  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

  def diameters
    wheels.collect {|wheel|
      diameter(wheel)}
  end

  #... What were once references to cell[1] have been transformed into message sends to wheel.tire.
  # The wheelify method contains the only bit of code that understands the struc- ture of the incoming array.
  # It trades in- dexing into a structure for sending messages to an object.
  # If you can control the input, pass in a useful object, but if you are compelled to take a messy structure, hide the mess even from yourself.

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect {|cell| Wheel.new(cell[0], cell[1])}
  end
end

p RevealingReferences.new([[123, 321], [234, 432]]).diameters
