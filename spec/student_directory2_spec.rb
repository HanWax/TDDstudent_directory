require 'student_directory2'

describe  "Student Directory TDD Project" do 
	context 'print information' do
		it "prints header here" do
			header = "The students of Makers Academy\n======================================="
			expect(print_header).to eq header
		end
	
	 	it "print footer here" do
	 		footer = "Overall, we have #{student_list.length} great students"
	 		expect(print_footer).to eq footer
		end

		it 'asks for all information' do

		end
	end

	context 'student directory' do
		it "has no students" do
			expect(student_list).to eq []
		end

		it "adds a student" do 
			student = {:name => "David", :cohort => :June, :hobby => "running"}
			add(student)
			expect(student_list).to eq [student]
		end

		it 'takes a student' do 
			student = {name: "David", cohort: :June, :hobby => "running"}
			expect(student_to_s(student)).to eq 'David who likes running in the June cohort' 
		end

		it "print each name" do 
			%w{David Chloe Zoe}.each do |name|
				add({name: name, cohort: :June, hobby: "running"})
			end
			expect(list_of_students).to eq("1. David who likes running in the June cohort\n2. Chloe who likes running in the June cohort\n3. Zoe who likes running in the June cohort")
			print_students
		end
	end

	context 'user for input' do 

		it "ask user for student name" do 
			name = "David\n"
			expect(self).to receive(:puts).with("What's your name?")
			expect(self).to receive(:gets).and_return(name)
			expect(student_name).to eq 'David'
		end

		it "ask user for hobby" do
			hobby = "Running\n"
			expect(self).to receive(:puts).with("What's your hobby?")
			expect(self).to receive(:gets).and_return(hobby)
			expect(student_hobby).to eq 'Running'
		end

		it 'inputs a cohort' do
			month = "June\n"
			expect(self).to receive(:puts).with("What's your cohort?")
			expect(self).to receive(:gets).and_return(month)
			expect(student_cohort).to eq 'June'
		end

		it 'knows that June is a month' do
			expect(month_exists?('june')).to be true
		end

		it 'knows that Bloom is not a month' do
			expect(month_exists?('Bloom')).not_to be true
		end

		it 'will not allow us to input the wrong month' do
			month = "blah\n"
			allow(self).to receive(:gets).and_return(month)
			expect(student_cohort).to eq 'You entered the wrong month name!'
		end
	end
end