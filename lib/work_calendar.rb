# frozen_string_literal: true

require 'work_calendar/version'
require 'active_support/time'

module WorkCalendar
  SPECIAL_DAYS = {
    2018 => {
      12 => {
        workdays: [29],
        holidays: [31]
      }
    },
    2019 => {
      1 => {
        holidays: [1, 2, 3, 4, 7, 8]
      },
      3 => {
        holidays: [8]
      },
      5 => {
        holidays: [1, 2, 3, 9, 10]
      },
      6 => {
        holidays: [12]
      },
      11 => {
        holidays: [4]
      }
    },
    2020 => {
      1 => {
        holidays: [1, 2, 3, 6, 7, 8]
      },
      2 => {
        holidays: [24]
      },
      3 => {
        holidays: [9]
      },
      5 => {
        holidays: [1, 4, 5, 11]
      },
      6 => {
        holidays: [12]
      },
      11 => {
        holidays: [4]
      }
    },
    2021 => {
      1 => {
        holidays: [1, 4, 5, 6, 7, 8]
      },
      2 => {
        holidays: [23]
      },
      3 => {
        holidays: [8]
      },
      5 => {
        holidays: [3, 10]
      },
      6 => {
        holidays: [14]
      },
      11 => {
        holidays: [4]
      }
    }
  }.freeze

  class << self
    def workday?(date = Time.zone.today)
      year_hash = SPECIAL_DAYS[date.year]
      if year_hash
        month_hash = year_hash[date.month]
        if month_hash
          holidays = month_hash[:holidays]
          return false if holidays&.include?(date.day)

          workdays = month_hash[:workdays]
          return true if workdays&.include?(date.day)
        end
      end
      (1..5).cover?(date.wday)
    end

    def next_workday(num = 1, date = Time.zone.today)
      num.times { date = _next_workday(date) }
      date
    end

    def prev_workday(num = 1, date = Time.zone.today)
      num.times { date = _prev_workday(date) }
      date
    end

    def first_workday_since(date = Time.zone.today)
      return date if workday?(date)

      _next_workday(date)
    end

    def last_workday_since(date = Time.zone.today)
      return date if workday?(date)

      _prev_workday(date)
    end

    private

    def _next_workday(date)
      next_date = date + 1.day
      next_date += 1.day until workday? next_date
      next_date
    end

    def _prev_workday(date)
      prev_date = date - 1.day
      prev_date -= 1.day until workday? prev_date
      prev_date
    end
  end
end
