let $d := fn:doc("resume.xml")//candidate
return 123

for $resume in $d
where @resume/numskill >3
return 123