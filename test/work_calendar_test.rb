# frozen_string_literal: true

require 'test_helper'
require 'date'

class WorkCalendarTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::WorkCalendar::VERSION
  end

  def test_workday_method
    assert WorkCalendar.workday?(Date.new(2018, 12, 29))
    refute WorkCalendar.workday?(Date.new(2018, 12, 30))
    refute WorkCalendar.workday?(Date.new(2018, 12, 31))
    assert WorkCalendar.workday?(Date.new(2019, 2, 1))
    refute WorkCalendar.workday?(Date.new(2019, 6, 12))
  end

  def test_next_workday_method
    assert_equal ::WorkCalendar.next_workday(1, ::Date.new(2018, 12, 28)), Date.new(2018, 12, 29)
    assert_equal ::WorkCalendar.next_workday(1, Date.new(2018, 12, 29)), Date.new(2019, 1, 9)
    assert_equal ::WorkCalendar.next_workday(2, Date.new(2018, 12, 28)), Date.new(2019, 1, 9)
  end

  def test_prev_workday_method
    assert_equal WorkCalendar.prev_workday(1, Date.new(2019, 5, 6)), Date.new(2019, 4, 30)
    assert_equal WorkCalendar.prev_workday(1, Date.new(2019, 5, 7)), Date.new(2019, 5, 6)
    assert_equal WorkCalendar.prev_workday(2, Date.new(2019, 5, 7)), Date.new(2019, 4, 30)
  end
end
