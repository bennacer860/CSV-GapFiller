require 'rubygems'
require "faster_csv"

table=FasterCSV.read('test.csv', :headers => :first_row)


#puts "print new table"
#table.each{|row|
#  puts row
#}
#puts '*' * 20



#we want to perform the modification on this cell index
cell_index=1
row=1
column=1
row_nb=table.size
#puts table[row][column].inspect

#for each row of the table
0.upto(row_nb-1) do |r|
	#puts table[r].inspect
	#if it is not the first cell and the  is empty 
	if r >0 && table[r][cell_index].strip.empty?
		table[r][cell_index]=table[r-1][cell_index]

#		puts " row #{r+1} needs to be edited with #{table[r-1][cell_index]}"
	end
		
end


#puts '*' * 20

#puts "print new table"
table.each{|row|
  puts row
}
