desc "att skapa mindmap"
    task :mindmap do
      FileUtils.mkdir_p "./src/mdenhance/" unless FileTest.directory?("./src/mdenhance/")
      title = get_stdin("Ange ett namn: ")
      slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      begin
        date = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d')
      end
      filename = File.join("./src/mdenhance/", "#{date}-mindmap-#{slug}.md")
      if File.exist?(filename)
        response = ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n'])
        abort("rake aborted!") if response == 'n'
      end

      puts "En ny fil har redan skapats: #{filename}"
      open(filename, 'w') do |uml|
        uml.puts '@startmindmap'
        uml.puts 'caption figure 1'
        uml.puts 'title My super title'
        uml.puts ''
        uml.puts '* <&flag>Debian'
        uml.puts '** <&globe>Ubuntu'
        uml.puts '*** Linux Mint'
        uml.puts '*** Kubuntu'
        uml.puts '*** Lubuntu'
        uml.puts '*** KDE Neon'
        uml.puts '** <&graph>LMDE'
        uml.puts '** <&pulse>SolydXK'
        uml.puts '** <&people>SteamOS'
        uml.puts '** <&star>Raspbian with a very long name'
        uml.puts '*** <s>Raspmbc</s> => OSMC'
        uml.puts '*** <s>Raspyfi</s> => Volumio'
        uml.puts ''
        uml.puts 'header'
        uml.puts 'My super header'
        uml.puts 'endheader'
        uml.puts ''
        uml.puts 'center footer My super footer'
        uml.puts ''
        uml.puts 'legend right'
        uml.puts '  Short'
        uml.puts '  legend'
        uml.puts 'endlegend'
        uml.puts '@endmindmap'
      end
    end
