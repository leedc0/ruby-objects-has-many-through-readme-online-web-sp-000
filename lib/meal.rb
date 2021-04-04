require 'pry'
class Meal
  attr_accessor :waiter, :customer, :total, :tip
 
  @@all = []
 
  # initializes with a waiter, a customer, a total and a tip
  def initialize(waiter, customer, total, tip=0)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end
 
  # is class method that returns the contents of @@all
  def self.all
    @@all
  end

end