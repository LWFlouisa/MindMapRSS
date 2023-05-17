# Require the Gem
require "mindmaprss"

# Forgot to include this module routine.
module GetMap
  class Mindmap
    def get_mindmap
      system("markdown _posts/input.md > _posts/input.txt; ruby create_issue.rb")
    end
  end
end

# Setting up feeder.
Mindmaprss::GetFeed.read_outcome
Mindmaprss::GetFeed.parse_map
GetMap::Mindmap.get_mindmap
