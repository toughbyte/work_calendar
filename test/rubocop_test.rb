# frozen_string_literal: true

require 'test_helper'

class RubocopTest < Minitest::Test
  def initialize(name)
    super(name)
    modified = `git diff master --name-only`
    untracked = `git ls-files --others --exclude-standard`
    excluded = Dir.glob('bin/*')
    files = (modified.split("\n") + untracked.split("\n") - excluded).join(' ')
    @report = files.blank? ? '' : `bundle exec rubocop #{files} -a`
  end

  def test_with_rubocop
    refute_match(/Offenses:/, @report, "Rubocop report:\n#{@report}")
  end
end
