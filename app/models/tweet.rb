class Tweet < ApplicationRecord
  belongs_to :user

  has_many :replies, class_name: "Tweet", foreign_key: "source_id"
  belongs_to :source, class_name: "Tweet", optional: true
end
