Factory.define :ticket do |t|
  t.title "A ticket"
  t.description "A ticket, nothing more"
  t.user { |u| u.association(:user) }
  t.project { |p| p.association(:project) }
end
