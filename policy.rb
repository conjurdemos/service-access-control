policy "service-access-control-1.1.0" do
  bacon = resource "food", "bacon"

  user "alice"

  user "bob" do
    can "fry", bacon
  end
end
