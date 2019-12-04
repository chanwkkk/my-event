class Comment < ApplicationRecord
    validate :comment_made_by_organization, on: :create

    belongs_to :organization, class_name: "User"
    belongs_to :volunteer, class_name: "User"
    belongs_to :event

    validates :organization_id, :volunteer_id, :event_id, presence: true
    validates :content, length:{minimum: 20}
    

    def comment_made_by_organization
       unless self.organization.is_organization
        errors.add(:organization_id, "has to be of an organization.")
       end
    end
end
