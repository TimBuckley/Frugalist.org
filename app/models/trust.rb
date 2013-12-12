class Trust < ActiveRecord::Base
  attr_accessible :entrustor_id, :trustee_id
  
  validates :entrustor_id, :trustee_id, presence: true
  
  belongs_to(
    :entrustors,
    class_name: "User",
    foreign_key: :trustee_id,
    primary_key: :id
  )
  
  belongs_to(
    :trustees,
    class_name: "User",
    foreign_key: :entrustor_id,
    primary_key: :id
  )
  
end
