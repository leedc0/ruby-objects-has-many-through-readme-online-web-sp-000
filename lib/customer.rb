require 'pry'
class Customer
  attr_accessor :name, :age

  @@all = []

  # initializes with a name and age
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  # is class method that returns the contents of @@all
  def self.all
    @@all
  end

  # initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  # returns an Array of Meal instances associated with this customer
  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  # returns an Array of Waiter instances associated with this customer's meals
  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end

  # is a method that associates a waiter and meal amount to a re-visiting customer
  def new_meal_20_percent(waiter, total)
    tip = total * 0.2
    Meal.new(waiter, self, total, tip)
  end

  # return the oldest customer who visited for a meal
  def self.oldest_customer
    oldest_age = 0
    oldest_customer = nil
    self.all.each do |customer|
      if customer.age > oldest_age
        oldest_age = customer.age
        oldest_customer = customer
      end
    end
    oldest_customer
  end

end
