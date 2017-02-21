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

  # Design experts notice domain objects (classes with data and behavior that are likely to be represented in DB) without concentrating on them;
  # they focus not on these objects but on the messages that pass between them.
  # Planning! Objects and the messages needed to satisfy this use case.

  # PRO --> The previous design emphasis was on classes and who and what they knew.
  # Suddenly, the conversation has changed; it is now revolving around mes- sages. Instead of deciding on a class and then figuring out its responsibilities, you are now deciding on a message and figuring out where to send it.
  # This transition from class-based design to message-based design is a turning point in your design career. “I need to send this message, who should respond to it?”


  # Chapter 5
  # Duck typed objects are chameleons that are defined more by their behavior than by their class.
  # It’s not what an object is that matters, it’s what it does.
  # Therefore: duck types, have public interfaces that represent a contract that must be explicit and well-documented.

  # Concrete code is easy to understand but costly to extend.
  # Abstract code may initially seem more obscure but, once understood, is far easier to change.
  # KEY: When you use polymorphism it’s up to you to make sure all of your objects are well-behaved.
  #

  # Duck typing smells
  # 1) Case statements that siwtch on class
  # 2) kind_of? or is_a?
  # 3) responds_to?

  # Chapter 6
  # Inheritance is, at its core, a mechanism for automatic message delegation. It defines a forwarding path for not-understood messages.
  # This is the exact problem that inheritance solves; that of highly related types that share common behavior but differ along some dimension.
  # The general rule for refactoring into a new inheritance hierarchy is to arrange code so that you can promote abstractions rather than demote concretions.
  # The best way to create an abstract superclass is by pushing code up from concrete subclasses.

  # Definition of Hook Method:
  # Abstract superclasses use the template method pattern to invite inheritors to supply specializations, and use hook methods to allow these
  # inheritors to contribute these specializations without being forced to send super. Hook methods allow subclasses
  # to contribute specializations without knowing the abstract algorithm. They remove the need for subclasses to send super
  # and therefore reduce the coupling between layers of the hierarchy and increase its tolerance for change.

  # Chapter 7
  # When objects that play a common role need to share behavior, they do so via a Ruby module.
  # The code defined in a module can be added to any object, be it an instance of a class, a class itself, or another module.
  # This contract is defined by the Liskov Substitution Principle, which in mathematical terms says that a subtype should be substitutable for its supertype, and in Ruby terms this means that an object should act like what it claims to be.
