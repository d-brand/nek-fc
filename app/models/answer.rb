class Answer < ApplicationRecord
    belongs_to :schedule
    validates :name, presence: true

    #Answer.where(reason: "sanka")
    scope :sanka, -> { where(reason: "sanka")}
    scope :tabun, -> { where(reason: "tabun")}
    scope :mitei, -> { where(reason: "mitei")}
    scope :kesseki, -> { where(reason: "kesseki")}
end
