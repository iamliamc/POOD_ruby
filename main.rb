require './wheel'
require './gear'

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference

# puts Gear.new(52, 11, @wheel).gear_inches
#
# puts Gear.new(52, 11).ratio

Gear.new(
  :chainring => 52,
  :cog => 11,
  :wheel => Wheel.new(26, 1.5)).gear_inches




# NOTES

# Chapter 3 Key Takeaway --- Depend on things that change less often than you do
# likelyhood of change = key piece of information to consider when choosing the direction of dependencies
# Depending on an abstraction is always safer than depending on a concretion because by its very nature, the abstraction is more stable.
  # Duck typing a set of classes that respond to .diameter is more stable than
  # Any one of the actual classes that respond to .diameter

# Chapter 4
  # Desired 'message' network --> Each reveals as little about itself, and knows as little about others, as possible.
