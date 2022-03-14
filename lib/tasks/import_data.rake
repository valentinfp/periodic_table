namespace :import do
  desc 'Import periodic table data from json'
  task :data, file: :environment do |t, args|
    puts 'rails import:data[file_path] required' && return unless args[:file]
    puts "Importing file #{args[:file]}"

    # TODO: Escreva o código para importar os dados aqui
  end
end
