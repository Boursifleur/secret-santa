class ParticipantsController < ApplicationController

  def create
    @participant = Participant.new(participant_params)
    @participant.event_id = params[:id]
    if @participant.save
      redirect_to even_path(@event)
    end
  end

  private

  def participant_params
      params.require(:participant).permit(:name, :email)
  end
end
