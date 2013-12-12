class Transaction < ActiveRecord::Base
  attr_accessible :user_id, :description, :amount, :category, :privacy, :date

  validates :user_id, :description, :amount, :date, presence: true

  validates_inclusion_of :privacy, in: ["private", "shared"], allow_nil: true


  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

end
