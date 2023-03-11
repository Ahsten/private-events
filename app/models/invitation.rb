class Invitation < ApplicationRecord
    belongs_to :attendee, class_name: "User"
    belongs_to :event, class_name: "Event"

    enum status: {
        not_attending: 1,
        attending: 2,
      }
end
