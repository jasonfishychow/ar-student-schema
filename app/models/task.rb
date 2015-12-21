class Task < ActiveRecord::Base

#cannot use any pre-defined method.

  def self.list
  	self.all.each do |x|
  		print " " + x.id.to_s + ". "
   		if x.completed == true then
   			print "[X] "
   		else
   			print "[ ] "
   	end
  	puts x.text
  	end
  end
 
  def self.add(task_name, complete_stat)
    self.create(text: task_name, completed: complete_stat)
  end
 
  def self.delete_this(id)
    puts self.find(id).text + " has been deleted"
    self.delete(id)
  end
 
  def self.list_complete
  	self.where(completed: true).each do |x|
  		puts "[X] " + x.text
  	end
  end
 
  def self.complete(id)
  	if self.find(id).completed == false	
  		puts self.find(id).text + " has been marked as completed"
    	self.update(id, completed: true)
    else
  		puts self.find(id).text + " has been marked as incomplete"
    	self.update(id, completed: false)
    end
  end
end
