require 'date'

class Course
  attr_reader :name
  def initialize(name, dates_start, dates_end)
    @name = name
    @dates_start = Date.parse(dates_start)
    @dates_end = Date.parse(dates_end)
  end

  def datesBefore(filter_date)
     if @dates_start < filter_date
      puts "El curso #{@name}, comenzó el #{@dates_start} antes de #{filter_date}"
     end
  end

  def datesAfter(filter_date)
     if @dates_end > filter_date
      puts "El curso #{@name}, terminará el #{@dates_end} o sea despues de #{filter_date}"
     end
  end
end

file = File.open('cursos.txt', 'r')
data = file.readlines
file.close

course_list = []
data.each do |m|
  ls = m.split(', ')
  name = ls[0]
  dates_start = ls[1]
  dates_end = ls[2]
  course_list << Course.new(name, dates_start, dates_end)
end

 course_list.each do |course|
  print course.datesBefore(Date.today)
  print course.datesAfter(Date.today)
 end
