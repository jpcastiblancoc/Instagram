class BookSearchReflex < ApplicationReflex
  def perform(query = "")
    return unless query.size > 2

    @books = Profile.all
  end
end