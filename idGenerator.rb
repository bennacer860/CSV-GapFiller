require 'rubygems'
require "faster_csv"

table=FasterCSV.read('IDlist.csv', :headers => :first_row)


#take a CSV files and generate IDs according to these stupid rules:
#-if the name has one word the is is 'V'+the first 3 letter
#else its the 'V'+first letter of the first name+2 letters of the last name



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
	#puts table[r][cell_index]
	full_name=table[r][cell_index]
	name=full_name.split(' ')

	#if the name has one word pich the 3 first letter
	if name.size == 1
		#generate id
		table[r][0]="V#{name[0][0,3]}"
		#puts table[r][0]
	elsif	name.size == 3
		#if it has 3 words use the initials
		table[r][0]="V#{name[0][0,1]}#{name[1][0,1]}#{name[2][0,1]}"
	else
		#generate id
		table[r][0]="V#{name[0][0,1]}#{name[name.size-1][0,2]}"
		#puts table[r][0]
			

	end	
		
end


#puts '*' * 20

#puts "print new table"
table.each{|row|
  puts row
}
