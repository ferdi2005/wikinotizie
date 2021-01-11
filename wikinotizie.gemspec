Gem::Specification.new do |s|
  s.name = 'wikinotizie'
  s.version = "1.0.1"
  s.date = "2021-01-11"
  s.summary = "Parser di date per il template data di Wikinotizie"
  s.files = [
    "lib/wikinotizie.rb"
  ]
  s.require_paths = ["lib"]
  s.authors = ["Ferdinando Traversa"]
  s.homepage = "https://github.com/ferdi2005/wikinotizie"
  s.license = "MIT"
  s.add_runtime_dependency "date"
end

