Gem::Specification.new do |s|
  s.name = 'relative-require'
  s.version = '1.1'
  s.homepage = 'https://github.com/zimbatm/relative-require.rb'
  s.summary = 'Bringing relative requires to Ruby'
  s.description = 'This module changes the meaning of relative requires from "relative to the current pwd" to "relative to the requiring file". By just changing this little thing, it lets you remove lots of uglyness regarding $LOAD_PATH'
  s.author = 'Jonas Pfenniger'
  s.email = 'jonas@pfenniger.name'
  s.files = ['README.md', *Dir['{lib,test}/**/*']]
  s.require_paths = ['lib']
end
