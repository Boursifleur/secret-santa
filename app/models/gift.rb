class Gift < ApplicationRecord
  belongs_to :event
  belongs_to :sender, :class_name => 'Participant'
  belongs_to :receiver, :class_name => 'Participant', optional: true
end
