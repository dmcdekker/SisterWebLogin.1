
more_events = [
  {:what => 'Scrum', :where => 'Mills College',
    :when => '30/5/2016'},
  {:what => 'Interview Prep', :where => 'Mills College',
   :when => '16/5/2016'}
]

more_events.each do |events|
  Event.create!(events)
end
