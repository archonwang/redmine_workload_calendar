require File.dirname(__FILE__) + '/../test_helper'

class WeekTest < ActiveSupport::TestCase
  should "initialize correctly" do
    week = Week.new(2011,1)
    assert_equal 2011, week.year
    assert_equal 1, week.cweek
    week = Week.new(Date.new(2011,1,3))
    assert_equal 2011, week.year
    assert_equal 1, week.cweek
  end

  should "be comparable" do
    week1 = Week.new(2011,1)
    week2 = Week.new(2011,2)
    week3 = Week.new(2012,1)
    sorted = [week1,week2,week3]
    assert sorted, [week1,week3,week2].sort
    assert sorted, [week3,week2,week1,week2].uniq.sort
  end

  should "allow + and - operations" do
    week1 = Week.new(2011,1)
    week2 = Week.new(2011,2)
    week3 = Week.new(2012,1)
    assert_equal week1, week1 + 1 - 1
    assert_equal week2, week1 + 1
    assert_equal week3, week1 + 52
    assert_equal week1, week2 - 1
    assert_equal week1, week3 - 52
  end
end
