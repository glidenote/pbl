rspec_options = {
  all_on_start: false,
  notification: false,
  cli:          '--drb --color --format documentation',
  version:      2
}

guard 'rspec', rspec_options do
  watch(%r{^spec/.+_spec\.rb})
  watch(%r{^lib/(.+)\.rb})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') { "spec" }
end
