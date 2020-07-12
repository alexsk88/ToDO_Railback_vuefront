class Task < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, length: {minimum:4, maximum:50}
    validates :content, presence: true, length: {minimum:4, maximum:200}
    validates :date_end, presence: true
    validates :date_start, presence: true
    validates :state, presence: true

end
