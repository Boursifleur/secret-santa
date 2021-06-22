class EventsController < ApplicationController

  def index
    @events = Event.where(user: current_user)
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @participant = Participant.new
    @couples = []
    if @event.locked
      @event.gifts.each do |gift|
        @couples << [Participant.find(gift.sender_id), Participant.find(gift.receiver_id)]
      end
    end
  end


  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
    end
  end

   def starting_santa_sorting
    @event = Event.find(params[:event_id])
    if @event.has_enough_participants?
      @participants = @event.participants
      @couples = santa_couples(@participants)
      @event.locked = true
      @event.save
      @couples.each do |couple|
        Gift.create!(
          sender_id: couple[0].id,
          receiver_id: couple[1].id,
          event_id: @event.id
        )
      end
      redirect_to event_path(@event)
    end
  end

  private

  def santa_couples(array)
    array.to_a.shuffle!.unshift array.to_a.last
    array.each_cons(2).to_a
  end

  def event_params
    params.require(:event).permit(:name, :price)
  end

end
