system('date --date="today" > _timekeeping/mapdate.txt;
        date +"%H:%M" > _timekeeping/maptime.txt')

date    = File.read("_timekeeping/mapdate.txt").to_s
time    = File.read("_timekeeping/maptime.txt").to_s

# Require and include gem.
require 'rexml/document'
include REXML

# Read in XML document
# xmlfile = File.new("grammar.xml")
xmlfile = File.new("_outcomes/goodoutcome.xml")

xmldoc = Document.new(xmlfile)

# Get root elements.
root = xmldoc.root

# Listen to a form of grammar.
xmldoc.elements.each("mindmap/outcome") { 
  |e| print e.attributes["outcome"] + " "
}

# This will output the text of the user introduction.
xmldoc.elements.each("mindmap/title")     { |e| print e.text + " " }
xmldoc.elements.each("mindmap/date")      { |e| print e.text + " " }
xmldoc.elements.each("mindmap/time")      { |e| print e.text + "\n" }

xmldoc.elements.each("mindmap/neuromap/row") { |e| print e.text + "\n" }
