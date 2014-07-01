require 'date'
require 'CSV'
# print information
def print_header
	"The students of Makers Academy\n======================================="
end

def print_footer
	"Overall, we have #{student_list.length} great students"
end

# interactive menu
def interactive_menu
	puts "1. Input the students\n2. Show the students\n3. Save the list to students.csv\n4. Load the list from students.csv\n9. Exit"
	choice = gets.chomp
end

def initialise_menu
	menu_choice(interactive_menu)
end

def number_exists?(number)
	number = Integer(number) rescue nil
end

def ask_all_questions
	name = student_name
	hobby = student_hobby
	cohort = student_cohort
	student = {:name => name, :hobby => hobby, :cohort => cohort}
	add(student)
end

def end_programme
	exit 
end

def menu_choice(number)
	case number
		when "1"
			ask_all_questions
		when "2"
			print_students
		when "3"
			save(student_list)
		when "4"
			load_students
		when "9"
			end_programme
		else
	end
end

# adding and taking students
def student_list
	@student_list ||= []
end

def add(student)
	student_list << student
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

# ask user for input
def get_input(question)
	puts "What's your #{question}?"
	gets.chomp
end

def student_name
	get_input("name")
end

def student_hobby
	get_input("hobby")
end

def student_cohort
	month = get_input("cohort")
	return 'You entered the wrong month name!' unless month_exists?(month)
	month
end

def month_exists?(month)
	Date::MONTHNAMES.include?(month.downcase.capitalize)
end

#saving and loading files
def student_to_csv(student)
	student.values
end

def save(students)
	CSV.open("../students.csv", "wb") do |csv|
		students.each do |student|
		csv << student_to_csv(student)
		end
	end
end

def create_student(name, cohort, hobby)
	{name: name, cohort: cohort, hobby: hobby} 
end

def load_students
	CSV.foreach("../students.csv", "r") do |row|
		student_list << create_student(row[0], row[1], row[2])
	end
end

# outputting everything
def print_everything
	puts print_header
	puts print_students
	puts print_footer
end


# loop do
# menu_choice(interactive_menu)
# end
