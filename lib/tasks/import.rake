require 'roo'
namespace :import do
  desc "Import data from spreadsheet"
  task data: :environment do
    puts 'Importing Data' # add this line
    data = Roo::Spreadsheet.open('lib/data.xlsx') # open spreadsheet
  end
end