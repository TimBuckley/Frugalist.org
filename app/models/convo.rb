class Convo < ActiveRecord::Base
  attr_accessible :shower_user, :show_user

  validates :shower_user, :show_user, presense: true

  has_many(
    :messages,
    class_name: "Message",
    foreign_key: :convo_id,
    primary_key: :id
  )

  has_many(
    :shower_users,
    class_name: "User",
    foreign_key: :shower_user,
    primary_key: :id
  )

  has_many(
    :show_users,
    class_name: "User",
    foreign_key: :show_user,
    primary_key: :id
  )


end
