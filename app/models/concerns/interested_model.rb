module InterestedModel
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
    validates :email, presence: true, email: true
    validates :content, presence: true
  end
end
