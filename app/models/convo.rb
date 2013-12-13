class Convo < ActiveRecord::Base
  attr_accessible :pairing

  validates :pairing, presence: true, uniqueness: true

  has_many(
    :messages,
    class_name: "Message",
    foreign_key: :convo_id,
    primary_key: :id
  )

end
