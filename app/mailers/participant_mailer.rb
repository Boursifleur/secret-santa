class ParticipantMailer < ApplicationMailer

  def santa_sorting_mail(gift)
    @sender = Participant.find(gift.sender_id)
    @receiver = Participant.find(gift.receiver_id)
    @event = Event.find(gift.event_id)
    mail to: @sender.mail, subject: "Santa is coming"
  end
end
