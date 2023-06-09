class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :birthdate, :color, :name, :sex, presence:true
    validates :color , inclusion: { in: ['Black', 'White', 'Orange', 'Gray'] }
    validates :sex , inclusion: { in: ["M", "F"]}
    validate :valide_birthday


    def valide_birthday
        if  birthdate > Date.today
          errors.add(:birthdate, "can't be in the future")
        end
    end

    def age
        # birth = Time.new(:birthdate.years-:birthdate.months-:birthdate.days)
        Date.time_ago_in_words(birthdate)
        # time_ago_in_words(Time.now)                           # => less than a minute
        # time_ago_in_words(Time.now, include_seconds: true) # => less than 5 seconds

        # from_time = Time.now - birthdate.years - birthdate.months - birthdate.days
    end





end
