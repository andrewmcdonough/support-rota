require 'sinatra'

DEVELOPERS = %w(Andrew Alex Dan Tijmen Erik)
START_DATE = Time.mktime(2021,05,10)

get '/' do
  @who = who_is_on_lighthouse(Time.now)
  erb :index
end

def who_is_on_lighthouse(date)
  who_is_on_lighthouse_on_day(days_since_start(date))
end

def who_is_on_lighthouse_on_day(day)
  developers = DEVELOPERS.clone
  (1..day).each do |i|
    next if [1,2].include? i % 7
    developers.rotate!
  end
  return developers[0]
end

def days_since_start(date)
  ((date - START_DATE) / (60*60*24)).floor
end
