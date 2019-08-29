# frozen_string_literal: true

require 'test_helper'

class RubocopTest < Minitest::Test
  #   def initialize test
  #     modified = `git diff master --name-only`
  #     untracked = `git ls-files --others --exclude-standard`
  #     excluded = Dir.glob('bin/*')
  #     files = (modified.split("\n") + untracked.split("\n") - excluded).join(' ')
  #     @report = files.blank? ? '' : `bundle exec rubocop #{files}`
  #   end

  #   def test_with_rubocop
  #     assert_no_match(/Offenses:/, @report, "Rubocop report:\n#{@report}")
  #   end
end
