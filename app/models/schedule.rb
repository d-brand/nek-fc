class Schedule < ApplicationRecord
    has_many :answer, dependent: :destroy
    validates :place, presence: true
    validates :addcomment, presence: true

    scope :uketsukechu, -> { where("schedules.ymd > ?", Time.current.yesterday) }
    # default_scope -> { order(ymd: :asc) }
end
