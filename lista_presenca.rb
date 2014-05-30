presence = []
file_reader = File.foreach('presenca.txt')
total_lines = file_reader.next.to_i
if total_lines < 1 || total_lines > 100_000
  STDOUT.puts "Quantidade de linhas deve estar entre 1 e 100.000"
  exit(1)
end
total_lines.to_i.times do
  value = file_reader.next.to_i
  if value < 0 || value > 1_000_000
    STDOUT.puts "numero de registro invalido. Valor precisa estar entre 0 e 1.000.000"
    exit(1)
  end
  presence[value] = 0b1
end
puts
puts 'counter'
puts presence.count(0b1)
