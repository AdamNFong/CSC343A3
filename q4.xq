(:for $skill in fn:doc("interview.xml")//assessment
return $allskills:)


let $docInterview := fn:doc("interview.xml")
let $docResume := fn:doc("resume.xml")

let $interviews := $docInterview//interview 
let $resumes := $docResume//resume

for $skill in $interviews/assessment

let $tech := $skill/techProficiency
let $communication := $skill/communication
let $enthusiasm := $skill/enthusiasm
let $collegiality := $skill/collegiality
let $allskills := ($tech | $enthusiasm | $communication | $collegiality)

let $max := max ($allskills)

for $maxSkill in $allskills
where $maxSkill = $max


return $maxSkill
	