
more_events = [
  {:what => 'Scrum', :where => 'Mills College',
    :when => '29/4/2016'},
  {:what => 'Interview Prep', :where => 'Mills College',
   :when => '15/4/2016'}
]

more_events.each do |events|
  Event.create!(events)
end
