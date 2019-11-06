# frozen_string_literal: true

require_relative './test_helper'
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

  def test_first_workday_since
    assert_equal WorkCalendar.first_workday_since(Date.new(2019, 1, 1)), Date.new(2019, 1, 9)
    assert_equal WorkCalendar.first_workday_since(Date.new(2019, 11, 1)), Date.new(2019, 11, 1)
    assert_equal WorkCalendar.first_workday_since(Date.new(2019, 11, 2)), Date.new(2019, 11, 5)
    assert_equal WorkCalendar.first_workday_since(Date.new(2019, 11, 9)), Date.new(2019, 11, 11)
    assert_equal WorkCalendar.first_workday_since(Date.new(2019, 11, 10)), Date.new(2019, 11, 11)
  end

  def test_last_workday_since
    assert_equal WorkCalendar.last_workday_since(Date.new(2019, 1, 8)), Date.new(2018, 12, 29)
    assert_equal WorkCalendar.last_workday_since(Date.new(2019, 11, 1)), Date.new(2019, 11, 1)
    assert_equal WorkCalendar.last_workday_since(Date.new(2019, 11, 4)), Date.new(2019, 11, 1)
    assert_equal WorkCalendar.last_workday_since(Date.new(2019, 11, 9)), Date.new(2019, 11, 8)
    assert_equal WorkCalendar.last_workday_since(Date.new(2019, 11, 10)), Date.new(2019, 11, 8)
  end
end
