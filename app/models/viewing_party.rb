class ViewingParty < ApplicationRecord
  belongs_to :host, class_name: "User"
  
  has_many :invitees
  has_many :users, through: :invitees
end