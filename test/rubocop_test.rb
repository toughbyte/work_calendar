# frozen_string_literal: true

require 'test_helper'

class RubocopTest < Minitest::Test
  def initialize(name)
    super(name)
    modified = `git diff master --name-only origin/master '*.rb'`
    untracked = `git ls-files --others --exclude-standard '*.rb'`
    excluded = Dir.glob('bin/*')
    files = (modified.split("\n") + untracked.split("\n") - excluded).join(' ')
    @report = files.blank? ? '' : `rubocop #{files}`
  end

  def test_with_rubocop
    refute_match(/Offenses:/, @report, "Rubocop report:\n#{@report}")
  end
end
