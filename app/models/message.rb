class Message < ActiveRecord::Base
  attr_accessible :convo_id, :author_id, :recipient_id, :body

  validates :convo_id, :author_id, :recipient_id, :body, presence: true

  belongs_to(
    :convo,
    class_name: "Convo",
    foreign_key: :convo_id,
    primary_key: :id
  )
  
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )
  
  belongs_to(
    :recipient,
    class_name: "User",
    foreign_key: :recipient_id,
    primary_key: :id
  )

end