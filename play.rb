require 'rest-client'
matcher = /<h2><a.*?>(?<text>.*?)<\/a.*?>/
puts "Welcome to Bing searcher!"
puts "The top ten results from Bing on your command line"

loop do
  puts "Type in word to search.  'quit' to Quit"
  word = gets.chomp
  break if word =~ /quit/i
  url = 'https://www.bing.com'
  response = RestClient.get url, {params: {q: word}}
  #result = matcher.match(response.body)
  result = response.body.scan(matcher)
  puts "-------------------------"
  puts "The results are:"
  puts result
  puts "-------------------------"
end
