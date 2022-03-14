namespace :import do
  desc 'Import periodic table data from json'
  task :data, [:file] => :environment do |t, args|
    puts 'rails import:data[file_path] required' && return unless args[:file]
    puts "Importing file #{args[:file]}"

    elements_list = JSON.parse(File.read(args[:file]))

    elements_list['order'].each do |element_name|
      element = elements_list[element_name].to_h
      category = ElementCategory.find_or_create_by(name: element['category']) unless element['category'] =~ /^unknown/
      Element.create(element.except!('category', 'color').merge({category: category}))
    end
  end
end
