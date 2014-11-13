lib_dir = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib_dir)
require 'cli'

cli = CLI.new($stdin,$stdout)
cli.calls
