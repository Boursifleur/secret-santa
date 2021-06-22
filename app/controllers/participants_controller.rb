class ParticipantsController < ApplicationController

  def create
    @participant = Participant.new(participant_params)
    @event = Event.find(params[:event_id])
    @participant.event = @event

    if @participant.save
      redirect_to event_path(@event)
    end
  end

  private

  def participant_params
      params.require(:participant).permit(:name, :email)
  end
end
