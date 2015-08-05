require 'minitest/autorun'
require 'minitest/pride'
require './lib/finder'

class FinderTest < Minitest::Test
  def test_it_works
    finder = OkCuGit::Finder.new("turingschool/challenges")

    contacts = finder.all_contributors
    contact1 = "Jeff Casimir <jeff@casimircreative.com>"
    contact2 = "Rachel Warbelow <rachelwarbelow@gmail.com>"

    assert contacts.include?(contact1)
    assert contacts.include?(contact2)
  end
end
