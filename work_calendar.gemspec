# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'work_calendar/version'

Gem::Specification.new do |spec|
  spec.name          = 'work_calendar'
  spec.version       = WorkCalendar::VERSION
  spec.authors       = ['Sergey Tomashevsky']
  spec.email         = ['sergey.tomashevsky@toughbyte.com']

  spec.summary       = 'Placeholder'
  spec.description   = 'Placeholder'
  spec.homepage      = 'https://toughbyte.com'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://toughbyte.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://toughbyte.com'
  spec.metadata['changelog_uri'] = 'https://toughbyte.com'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
end
