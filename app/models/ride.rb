class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
  	if can_ride
  		begin_ride
  	elsif !has_enough_tickets && not_short
  		"Sorry. You do not have enough tickets the #{attraction.name}."
  	elsif !not_short && has_enough_tickets
  		"Sorry. You are not tall enough to ride the #{attraction.name}."
  	else 
  		"Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
  	end
  		
  end

  private

  def begin_ride
  	self.user.update(
  		tickets: user.tickets - attraction.tickets,
  		nausea: user.nausea + attraction.nausea_rating,
  		happiness: user.happiness + attraction.happiness_rating
  	)
  	"Thanks for riding the #{self.attraction.name}!"
  end

  def can_ride
  	has_enough_tickets && not_short
  end

  def has_enough_tickets
  	user.tickets >= attraction.tickets
  end

  def not_short
  	user.height >= attraction.min_height
  end

end
