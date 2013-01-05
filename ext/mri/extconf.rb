if RUBY_PLATFORM == "java"
  # Don't do anything when run in JRuby; this allows gem installation to pass.
  # We need to write a dummy Makefile so that RubyGems doesn't think compilation
  # failed.
  File.open('Makefile', 'w') do |f|
    f.puts "all:"
    f.puts "\t@true"
    f.puts "install:"
    f.puts "\t@true"
  end
  exit 0
else
  require "mkmf"
  abort "This is a hacked extconf.rb"
  dir_config("bcrypt_ext")
  create_makefile("bcrypt_ext")
end
