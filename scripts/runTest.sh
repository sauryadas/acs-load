#!/bin/bash

URL=$1
THREADS=1
LOOPS=3

shift # past URL

while [[ $# > 1 ]]
do
key="$1"

case $key in
    -t|--threads)
    THREADS="$2"
    shift # past argument
    ;;
    -l|--loops)
    LOOPS="$2"
    shift # past argument
    ;;
    *)
	echo "Unkown option (Ignoring): $1 $2"
        # unknown option
    ;;
esac
shift # past argument or value
done

# Generate the Ruby test file
cat > test.rb <<EOF
require 'ruby-jmeter'

test do
  threads count: $THREADS, loops: $LOOPS do
    visit url: '$URL'
  end
end.run(
        properties: '/scripts/jmeter.properties'
)
EOF

# Run the test
ruby test.rb > /dev/null

# Output the results
cat jmeter.jtl
