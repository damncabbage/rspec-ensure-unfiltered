# rspec-ensure-unfiltered

A plugin for ensuring your RSpec tests don't run with a filter (eg. `focus: true`). Useful for CI runs.


## Installation

Add this line to your application's Gemfile, in the `test` group:

```ruby
gem 'rspec-ensure-unfiltered', group: :test
```

And then execute:

```
$ bundle
```


## Usage

In your `spec_helper.rb` (eg. `spec/spec_helper.rb`) or other RSpec config file, inside your `RSpec.configure` block:

```ruby
require 'rspec/ensure/unfiltered'
RSpec.configure do |config|
	RSpec::Ensure::Unfiltered.setup!(config)
end
```

To have this trigger on CI runs only (recommended), I'd recommend guarding it with a condition that checks the environment. This example should work for [Buildkite](https://buildkite.com), [Travis CI](https://travis-ci.org/) and [CircleCI](https://circleci.com/):

```ruby
require 'rspec/ensure/unfiltered'
RSpec.configure do |config|
	# Block the build if any example filtering is active,
	# eg. if we left a "focus: true" in a spec somewhere.
	if ENV['CI']
		RSpec::Ensure::Unfiltered.setup!(config)
	end
end
```

When triggered, the build will abort and you'll get something like this dumped into your console:

```
************************************************************************
Examples have been filtered; you're only running 1 out of 3845 examples.

You may have left a filter (eg. 'focus: true') in one of your *_spec.rb
files; is it one of these?
- ./spec/sandbox_spec.rb
************************************************************************
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/damncabbage/rspec-ensure-unfiltered. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the (https://github.com/damncabbage/rspec-ensure-unfiltered)[code of conduct].


## License

The gem is available as open source under the terms of the [Apache-2.0 License](https://opensource.org/licenses/Apache-2.0).
