require "rspec/ensure/unfiltered/version"
require "rspec"

module RSpec
  module Ensure
    module Unfiltered
      def self.setup!(config, world: nil)
        world ||= RSpec.world
        config.before(:suite) do
          # Yell if we're filtering, eg. we filter on 'focus: true' somewhere by accident.
          run_examples = world.example_count
          all_examples = world.all_examples.count
          if run_examples != all_examples
            paths = world.filtered_examples.flat_map(&:second).map(&:file_path).uniq.sort
            msg = [
              "Examples have been filtered; you're only running #{run_examples} out of #{all_examples} examples.",
              "",
              "You may have left a filter (eg. 'focus: true') in one of your *_spec.rb",
              "files; is it one of these?"
            ].concat(
              paths.map { |p| "- #{p}" }
            )
            border = "*" * msg.sort_by(&:length).last.length
            raise "\n\n#{border}\n#{msg.join("\n")}\n#{border}\n\n"
          end
        end
      end
    end
  end
end
