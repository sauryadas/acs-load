#!/bin/bash

# Generate the Ruby test file
cat > test.rb <<EOF
require 'ruby-jmeter'

test do
  threads count: 1, loops: 3 do
    visit name: '$1', url: 'http://$1'
  end
end.run(
        properties: '/scripts/jmeter.properties'
)
EOF

# Run the test
ruby test.rb > /dev/null

# Output the results
cat jmeter.jtl
