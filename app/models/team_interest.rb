class TeamInterest < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :content, presence: true
end
