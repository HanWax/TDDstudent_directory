require 'date'

def print_header
	"The students of Makers Academy\n======================================="
end

def print_footer
	"Overall, we have #{student_list.length} great students"
end

def student_list
	@student_list ||= []
end

def add(student)
	student_list << student
end

def student_name
	puts "What's your name?"
	name = gets.chomp
end

def student_hobby
	puts "What's your hobby?"
	hobby = gets.chomp
end

def student_cohort
	puts "What's your cohort?"
	month = gets.chomp
	return 'You entered the wrong month name!' unless month_exists?(month)
	month
end

def month_exists?(month)
	Date::MONTHNAMES.include?(month.downcase.capitalize)
end

def student_to_s(student)
	"#{student[:name]} who likes #{student[:hobby.downcase]} in the #{student[:cohort]} cohort"
end

def list_of_students
	student_list.map.with_index(1) do |student, index| 
	"#{index}. #{student_to_s(student)}"
	end.join("\n")
end

def print_students
	puts list_of_students
end