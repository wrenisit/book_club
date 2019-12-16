require 'rails_helper'

RSpec.describe "book index" do
  it "shows the books index page" do
    author_1 = Author.create(name: "Charles Dickens")
    book_1 = Book.create(title:"Oliver Twist", pages: "299", publication_year: "1850")
    book_2 = Book.create(title: "A Christmas Carol", pages: "150", publication_year: "1880")
    BookAuthor.create(author_id: author_1.id, book_id: book_1.id)
    visit '/books'

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.pages)
    expect(page).to have_content(book_1.publication_year)
    expect(page).to have_content(book_1.author.name)

    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_2.pages)
    expect(page).to have_content(book_2.publication_year)
    expect(page).to have_content(book_2.author.name)
  end
end

    # As a user,
    # When I visit '/books'
    # Then I see each book in the system including the book's:
    #   - title
    #   - number of pages
    #   - publication year
    #   - the name of each author that wrote the book
