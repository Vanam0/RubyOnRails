
puts '
   ▄███████▄  ▄█     █▄  ████████▄  
  ███    ███ ███     ███ ███   ▀███ 
  ███    ███ ███     ███ ███    ███ 
  ███    ███ ███     ███ ███    ███ 
▀█████████▀  ███     ███ ███    ███ 
  ███        ███     ███ ███    ███ 
  ███        ███ ▄█▄ ███ ███   ▄███ 
 ▄████▀       ▀███▀███▀  ████████▀  
                                    
'

def read_file(filename)
  file_content = File.read(filename)
  return file_content                                                                             # Funktio lukee tiedoston ja palauttaa sen sisällön
end


def generate_random_character
  characters = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
  return characters.sample                                                                       # Funktio, generoi satunnaisen merkin aakkosnumeerisesta joukosta
end

                                                                                                #  kysyy käyttäjältä 9 lukua ja tallennetaa ne listalle
lukulista = []
9.times do |i|
  print "Anna #{i+1}. luku väliltä 0-999: "
  luku = gets.chomp.to_i
  lukulista << luku
end

                                                                                                  # Luetaan tiedoston sisältö
tiedoston_sisalto = read_file("passwd.txt")

                                                                                                  # Muodostetaan salasana annettujen lukujen perusteella
salasana = ""
lukulista.each do |luku|
  if luku >= 0 && luku < tiedoston_sisalto.length
    salasana << tiedoston_sisalto[luku]
  else
    salasana << generate_random_character
  end
end

                                                                                                    # Tulosta luotu salasana
puts "Ohjelma loi salasanan #{salasana}"
