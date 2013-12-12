class Message < ActiveRecord::Base
  attr_accessible :convo_id, :author_id, :recipient_id, :body

  validates :convo_id, :author_id, :recipient_id, :body, presence: true

  belongs_to(
    :convo,
    class_name: "Convo",
    foreign_key: :convo_id,
    primary_key: :id
  )

end
