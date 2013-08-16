# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  # uncheck is nil if (un) isn't set
  rating_list.split(",").each do |rating|
    rating = "ratings_" + rating
    if uncheck
      uncheck(rating)
    else
      check(rating)
    end
  end
  #debugger
  #assert_equal uncheck, "un"
end

Then /I should (not )?see movies that are rated: (.*)/ do |negated, rating_list|
  #check if movies shown count equls what is in the db
  
  ratings = rating_list.split(",")
  db_count = 0
  page_count = 0
  ratings.each do |rating|
    db_count += Movie.find_all_by_rating(rating).size
  end
  #debugger
  page.all('table#movies tr').count.should == db_count +1 #add one to accomodate table header
end

When /I check all of the movies/ do |rating_list|
  ##
end

Then /I should see all of the movies/ do |negated, rating_list|
  #check if movies shown count equls what is in the db
  debugger
  ratings = rating_list.split(",")
  #rows.should == value
end