class EventsController < ApplicationController

  def index
    @events = Event.where(user: current_user)
  end

  def show
    @event = Event.find(params[:id])
  end

  def starting_santa_sorting
    @event = Event.find(params[:id])
    @participants = @event.participants
    @couples = santa_couples(@participants)
    @couples.shuffle!.unshift array.last
    @couples.each_cons(2).to_a
  end

end
