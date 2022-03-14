namespace :import do
  desc 'Import periodic table data from json'
  task :data, [:file] => :environment do |t, args|
    puts 'rails import:data[file_path] required' && return unless args[:file]
    puts "Importing file #{args[:file]}"

    elements_list = JSON.parse(File.read(args[:file]))
    used_colors = []  

    elements_list['order'].each do |element_name|
      element = elements_list[element_name].to_h

      unless element['category'] =~ /^unknown/
        unless category = ElementCategory.find_by(name: element['category'])
          color = get_random_hex
          while used_colors.include?(color) do # To make sure the colors don't repeat themselves
            color = get_random_hex 
          end
          used_colors.append(color)
          category = ElementCategory.create(name: element['category'], color: color)
        end
      end
      element_attrs = element.except!('category', 'color')
      element_attrs = element_attrs.merge({category: category}) if category
      Element.create(element_attrs)
    end
  end
end

def get_random_hex
  letters = '0123456789ABCDEF'.split('')
  color = '#'
  6.times do
    color += letters[rand(16)]
  end
  # Avoid too bright colors for contrast reasons
  while brightness(color) > 80 do
    color = get_random_hex
  end
  color
end

# Check color brightness ( 0 = darkest / 255 = lightest)
def brightness(color_hex)
  color_rgb = color_hex.match(/^#(..)(..)(..)$/).captures.map(&:hex)
  0.2126 * color_rgb[0] + 0.7152 * color_rgb[1] + 0.0722 * color_rgb[2];
end